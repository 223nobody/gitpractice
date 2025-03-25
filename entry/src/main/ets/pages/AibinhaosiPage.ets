import { router } from '@kit.ArkUI';

@Entry
@Component
struct AibinhaosiPage {
  build() {
    Column(){
      Row() {
        Image($r("app.media.back")).width(30)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/StorePage',
            })
          })
        Text("艾宾浩斯记忆曲线").fontSize(26).fontWeight(600).position({x:80})
      }.width("95%")
      .margin(20)
      Image($r("app.media.aibinhaosi")).width("110%").margin(10)
      Image($r("app.media.aibinhaosi2")).width("100%").margin(10)

    }
  }

}