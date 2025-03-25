import { router } from '@kit.ArkUI';


@Entry
@Component
struct AllappPage {
  build() {
    Stack({ alignContent: Alignment.Bottom}){
      Column(){
        Row(){
          Image($r("app.media.back")).width(30)
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/HomePage',
              })
            })
          Text("全部应用").position({x:150,y:5})
        }.width("100%")
        Text("首页应用").position({x:-30}).margin(40)
          .fontSize(22).fontWeight(700)
        Row() {
          Column() {
            Image($r("app.media.pk")).width(50).height(40)
            Text("单词pk").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.everyday")).width(50).height(40)
            Text("每日一句").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.beidanci")).width(50).height(40)
              .onClick(()=>{
                router.pushUrl({
                  url: 'pages/RememberPage',
                })
              })
            Text("背单词").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.tingli")).width(50).height(40)
            Text("英语听力").margin(10).fontSize(13)
          }.layoutWeight(1)
        }
        .margin({top:50,bottom:10})
        .height(100)
        .width("100%")
        .backgroundColor("#E0FFFF")
        .borderRadius(20)

        Text("更多应用").margin(20).position({x:-10,y:200})
          .fontSize(22).fontWeight(700)

        Row() {
          Column() {
            Image($r("app.media.m1")).width(60).height(50)
            Text("真题助手").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.m2")).width(60).height(50)
            Text("情景对话").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.m3")).width(60).height(50)
            Text("语法训练").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.m4")).width(60).height(50)
            Text("生活口语").margin(10).fontSize(13)
          }.layoutWeight(1)
        }
        .margin({top:80})
        .height(100)
        .width("100%")
        .backgroundColor("#E0FFFF")
        .borderRadius(20)

        Row() {
          Column() {
            Image($r("app.media.m5")).width(60).height(50)
            Text("每日跟读").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.m6")).width(60).height(50)
            Text("口语训练").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.m7")).width(60).height(50)
            Text("英文校对").margin(10).fontSize(13)
          }.layoutWeight(1)
          Column() {
            Image($r("app.media.m8")).width(60).height(50)
            Text("文档翻译").margin(10).fontSize(13)
          }.layoutWeight(1)

        }
        .padding({top:20,bottom:0})
        .margin({top:20})
        .height(100)
        .width("100%")
        .backgroundColor("#E0FFFF")
        .borderRadius(20)



      }.width("100%")
      .height("100%")
    }
  }
}