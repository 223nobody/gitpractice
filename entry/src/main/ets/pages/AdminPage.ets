import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from "@ohos/axios"

interface Result{
  code?:number,
  msg?:string,
  data?:string
}

@Entry
@Component
struct AdminPage {

  @State uname: string = ''
  @State upass: string = ''
  @State access: Result={}
  @State flag:boolean=false

  build() {
    RelativeContainer() {
      Row(){
        Column(){
          Text("账号登录").fontSize(20)
          Image($r('app.media.app')).width(160).margin(30)
          TextInput({placeholder:"请输入用户名:"})
            .onChange((value)=>{
              this.uname=value
            })
            .type(InputType.Normal).margin(10)
          TextInput({placeholder:"请输入密码:"})
            .onChange((value)=>{
              this.upass=value
            })
            .type(InputType.Password).margin(10)

          Button("登录").width('90%').margin(10)
            .onClick(()=>{
              axios.get<Result, AxiosResponse<Result>, Result>(
                'http://localhost:8080/user',
            {params:{ uname:this.uname, upass:this.upass}}
          ).then((data:AxiosResponse<Result>) => {
            this.access=data.data
                if(this.flag==true && this.access.code==1){
                  router.pushUrl({
                    url: 'pages/HomePage',
                  })
                }else{
                  AlertDialog.show({
                    message: "用户名或密码错误"
                  })
                }
          }).catch((error: AxiosError) => {
            console.error(error.message);
          })
          })
          Row(){
            Checkbox().width(20)
              .onClick(()=>{
                this.flag=true
              })
            Text(){
              Span("我已经阅读并同意")
              Span("《隐私政策》").fontColor("3274f6")
              Span("、")
              Span("《账号声明》").fontColor("3274f6")
              Span("和")
              Span("《中国移动认证服务条款》").fontColor("3274f6")
            }.width("90%").margin({top:10})
          }
          Row({ space: 150 } ){
            Button("注册账号").fontColor("black").backgroundColor("white")
              .onClick(()=>{
                router.pushUrl({
                  url: 'pages/ZhucePage',
                })
              })
            Button("忘记密码").fontColor("black").backgroundColor("white")
              .onClick(()=>{
                router.pushUrl({
                  url: 'pages/MimaPage',
                })
              })
          }.margin(5)
          Image($r("app.media.dictionary"))
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}


