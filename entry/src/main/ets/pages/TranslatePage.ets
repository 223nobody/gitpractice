import { router } from '@kit.ArkUI';


@Entry
@Component
struct TranslatePage {
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Stack({ alignContent: Alignment.Top}){
        Column() {
          Row() {
            Image($r("app.media.back")).width(30)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/HomePage',
                })
              })
            Text("翻译界面").position({x:150,y:5})
          }.width("100%")
          .margin(20)
          TextInput({placeholder:"请输入要翻译的内容"})
            .width("100%")
            .height(200)

          Row({space:10}){
            Button("语音翻译").layoutWeight(1)
              .backgroundColor("#00BFFF")
              .onClick(()=>{
                AlertDialog.show({
                  message: "请上传语音"
                })
              })
            Button("图片翻译").layoutWeight(1)
              .backgroundColor("#00BFFF")
              .onClick(()=>{
                AlertDialog.show({
                  message: "请上传图片"
                })
              })
            Button("文档翻译").layoutWeight(1)
              .backgroundColor("#00BFFF")
              .onClick(()=>{
                AlertDialog.show({
                  message: "请上传文档"
                })
              })
          }.margin({left:10,right:10})
        }


      }.width("100%")
      .height("100%")

      //底部导航
      Row(){
        Column() {
          Image($r("app.media.select")).width(35).margin({bottom:2})
          Text("查词").fontSize(12)
        }.layoutWeight(1)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/HomePage',
          })
        })
        Column() {
          Image($r("app.media.translate")).width(35).margin({bottom:2})
            .fillColor("#00BFFF")
          Text("翻译").fontSize(12)
        }.layoutWeight(1)
        Column() {
          Image($r("app.media.ku")).width(35).margin({bottom:2})
          Text("词库").fontSize(12)
        }.layoutWeight(1)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/StorePage',
          })
        })
        Column() {
          Image($r("app.media.user")).width(35).margin({bottom:2}).fillColor(Color.Black)
          Text("我的").fontSize(12)
        }.layoutWeight(1)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/UserPage',
          })
        })
      }.backgroundColor(Color.White)

    }
    .width("100%")
    .height("100%")
  }
}
