import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';
import {User} from './MimaPage'

interface Result{
  code?:number,
  msg?:string,
  data?:string
}

@Entry
@Component
struct ZhucePage {

  @State uname: string = ''
  @State upass: string = ''
  @State access: number=0

  build() {
    RelativeContainer() {
      Row(){
        Column(){
          Text("注册账号").fontSize(20)
          Image($r('app.media.app')).width(160).margin(30)
          TextInput({placeholder:"请输入账号:"}).type(InputType.Normal).margin(10)
            .onChange((value)=>{
              this.uname=value
            })
          TextInput({placeholder:"请输入密码:"}).type(InputType.Password).margin(10)
            .onChange((value)=>{
              this.upass=value
            })
          Button("注册").width('90%').margin(10)
            .onClick(()=>{
              axios.post<Result, AxiosResponse<Result>, User>(
                'http://localhost:8080/user',
                {uname:this.uname,upass:this.upass},
              ).then((data:AxiosResponse<Result> ) => {
                if(data.data.code!=undefined){
                  this.access=data.data.code
                }
              }).catch((error: AxiosError) => {
                console.error(error.message);
              })
              AlertDialog.show({
                    message: "注册成功"
              })
            })
          Button("登录").width('90%').fontColor("black").backgroundColor("white")
            .onClick(()=>{
            router.pushUrl({
              url: 'pages/AdminPage',
            })
          })
          Image($r("app.media.dictionary"))
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}