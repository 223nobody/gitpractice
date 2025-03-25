import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';


interface Result{
  code?:number,
  msg?:string,
  data?:string
}
export interface User{
  uname:string,
  upass:string
}

@Entry
@Component
struct MimaPage {

  @State uname: string = ''
  @State upass: string = ''
  @State newpass: string=''
  @State access: number=0

  build() {
    RelativeContainer() {
      Row(){
        Column(){
          Image($r("app.media.back")).width(30).position({x:0,y:0})
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/AdminPage',
              })
            })
          Text("重置密码").fontSize(20)
          Image($r('app.media.app')).width(160).margin(30)
          TextInput({placeholder:"请输入账号:"}).type(InputType.Normal).margin(10)
            .onChange((value)=>{
              this.uname=value
            })
          TextInput({placeholder:"请输入密码:"}).type(InputType.Password).margin(10)
            .onChange((value)=>{
              this.upass=value
            })
          TextInput({placeholder:"请输入新密码:"}).type(InputType.Password).margin(10)
            .onChange((value)=>{
              this.newpass=value
            })

          Button("重置密码").width('90%').margin(10)
            .onClick(()=>{
              axios.put<Result, AxiosResponse<Result>, User>(
                'http://localhost:8080/user',
                {uname:this.uname,
                  upass:this.upass},
                {params:{newpass:this.newpass}}
              ).then((data:AxiosResponse<Result> ) => {
                console.log('result:' + JSON.stringify(data.data.code));
                if(data.data.code!=undefined){
                  this.access=data.data.code
                }
              }).catch((error: AxiosError) => {
                console.error(error.message);
              })
              if(this.access=1){
                AlertDialog.show({
                  message: "修改成功"
                })
              }else {
                AlertDialog.show({
                  message: "修改失败"
                })
              }
            })
          Image($r("app.media.dictionary"))
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}