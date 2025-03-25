import { router } from '@kit.ArkUI';


@Entry
@Component
struct StorePage {
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
            Text("我的词库").position({x:150,y:5})
          }.width("100%")
          .margin(20)

          Row({space:10}){
           Column(){
             Text("查词历史").fontSize(20).fontColor("white").margin({top:15})
             Text("全面回顾").fontSize(13).fontColor("white").margin(10)
           }.layoutWeight(1).borderRadius(10).backgroundColor("#00BFFF").height(120).margin({top:15})
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/HistoryPage',
              })
            })
            Column(){
              Text("艾宾浩斯").fontSize(20).fontColor("white").margin({top:15})
              Text("疑难词表记忆计划").fontSize(13).fontColor("white").margin(10)
            }.layoutWeight(1).borderRadius(10).backgroundColor("#20B2AA").height(120).margin({top:15})
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/AibinhaosiPage',
              })
            })
            Column(){
              Text("我的生词本").fontSize(20).fontColor("white").margin({top:15})
              Text("加强生词记忆温故知新").fontSize(13).fontColor("white").margin(10)
            }.layoutWeight(1).borderRadius(10).backgroundColor("#FF6A6A").height(120).margin({top:15})
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/AllwrongPage',
              })
            })
          }

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
          Text("翻译").fontSize(12)
        }.layoutWeight(1)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/TranslatePage',
          })
        })
        Column() {
          Image($r("app.media.ku")).width(35).margin({bottom:2})
            .fillColor("#00BFFF")
          Text("词库").fontSize(12)
        }.layoutWeight(1)
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
