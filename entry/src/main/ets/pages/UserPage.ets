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
            Text("我的账号").position({x:140,y:5})
            Image($r("app.media.setting")).width(30).position({x:"90%"})
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/SettingPage',
                })
              })
          }.width("100%")
          Column(){
            Image($r("app.media.yonghu")).width(200).borderRadius(20)
            Text("223").fontSize(20).margin(20).fontColor("#00BFFF")
            Text("常用功能").fontSize(25).position({x:10,y:240})
              .fontWeight(600).margin({bottom:15})

            Row() {
              Column() {
                Image($r("app.media.u1")).width(50).height(50)
                Text("我的课程").margin(10).fontSize(15)
              }.layoutWeight(1)
              Column() {
                Image($r("app.media.u2")).width(50).height(50)
                Text("我的书架").margin(10).fontSize(15)
              }.layoutWeight(1)
              Column() {
                Image($r("app.media.u3")).width(50).height(50)
                Text("购买记录").margin(10).fontSize(15)
              }.layoutWeight(1)
              Column() {
                Image($r("app.media.u4")).width(50).height(50)
                Text("我的收藏").margin(10).fontSize(15)
              }.layoutWeight(1)
            }
            .height(100)
            .width("100%")
            .backgroundColor("white")
            .borderRadius(20)
            .margin(20)
            Row() {
              Column() {
                Image($r("app.media.u5")).width(50).height(50)
                Text("我的订阅").margin(10).fontSize(15)
              }.layoutWeight(1)
              Column() {
                Image($r("app.media.u6")).width(50).height(50)
                Text("离线词典").margin(10).fontSize(15)
              }.layoutWeight(1)
              Column() {
                Image($r("app.media.u7")).width(50).height(50)
                Text("下载管理").margin(10).fontSize(15)
              }.layoutWeight(1)
              Column() {
                Image($r("app.media.u8")).width(50).height(50)
                Text("翻译记录").margin(10).fontSize(15)
              }.layoutWeight(1)
            }
            .height(100)
            .width("100%")
            .backgroundColor("white")
            .borderRadius(20)


          }.margin({top:20})



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
          Text("词库").fontSize(12)
        }.layoutWeight(1)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/StorePage',
          })
        })
        Column() {
          Image($r("app.media.user")).width(35).margin({bottom:2}).fillColor(Color.Black)
            .fillColor("#00BFFF")
          Text("我的").fontSize(12)
        }.layoutWeight(1)
      }.backgroundColor(Color.White)
    }
    .width("100%")
    .height("100%")
  }
}
