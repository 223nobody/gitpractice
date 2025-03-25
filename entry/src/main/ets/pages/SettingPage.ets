import { router } from '@kit.ArkUI';


@Entry
@Component
struct StorePage {
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Stack({ alignContent: Alignment.Top }) {
        Column() {
          Row() {
            Image($r("app.media.back")).width(30)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/UserPage',
                })
              })
            Text("设置").position({ x: 160, y: 5 })
          }.width("100%")

          Text("消息提示").position({x:0,y:40}).margin({top:20,left:20}).fontColor("#1E90FF")
          Text("个性化推送设置                                >")
            .fontSize(20).fontWeight(600).margin({top:60})
            .onClick(()=>{
              AlertDialog.show({
                message: "开启个性化推送"
              })
            }).backgroundColor("#EEE9E9")
            .borderRadius(20)
            .height(100)

          Text("其他").position({x:0,y:200}).margin({top:20,left:20}).fontColor("#1E90FF")
          Text("  账号安全                                         >")
            .fontSize(20).fontWeight(600).margin({top:60})
            .backgroundColor("#EEE9E9")
            .borderRadius(20)
            .height(100)
          Text(){
            Span("  清理缓存").fontSize(20).fontWeight(600)
            Span("                         当前缓存为2.98M  ").fontSize(15).fontColor("#696969")
            Span(">").fontSize(20).fontWeight(600)
          }
            .margin({top:20})
            .backgroundColor("#EEE9E9")
            .borderRadius(20)
            .height(100)
          Text("  帮助与反馈                                      >")
            .fontSize(20).fontWeight(600).margin({top:20})
            .backgroundColor("#EEE9E9")
            .borderRadius(20)
            .height(100)
          Text(){
            Span("  关于                          ").fontSize(20).fontWeight(600)
            Span("当前版本 V11.5.5  ").fontSize(15).fontColor("#696969")
            Span(">").fontSize(20).fontWeight(600)
          }
            .margin({top:20})
            .backgroundColor("#EEE9E9")
            .borderRadius(20)
            .height(100)

        }


      }.width("100%")
      .height("100%")
    }
  }
}