import { router } from '@kit.ArkUI'

@Entry
@Component

struct HomePage {

  build() {
    Stack({ alignContent: Alignment.Bottom}){
      //顶部设计
      Stack({ alignContent: Alignment.Top}){
        Row() {
          Column() {
            Text() {
              Span("距离六级考试还有").fontSize(25).fontColor(Color.White)
              Span(" 9 ").fontSize(30).fontColor(Color.Pink)
              Span("天 >").fontSize(25).fontColor(Color.White)
            }.margin({ left:-40,top:10})

            Row() {
              Image($r("app.media.select")).width(30).margin({left:8})
              Text(" 请输入您想要搜索的内容").fontColor("#696969")
              Image($r("app.media.xj")).width(30).fillColor(Color.Gray).margin({left:65})
              Image($r("app.media.voice")).width(30).fillColor(Color.Gray)
            }
            .onClick(()=>{
              router.pushUrl({
                url: 'pages/SelectPage',
              })
            })
            .borderRadius(10)
            .width("95%")
            .height(40)
            .backgroundColor("#EEE9E9")
            .margin({ top: 15 })
          }.width("100%")
          .height(135)
          .backgroundColor("#1E90FF")
        }.zIndex(100)

          //主体展示
          Scroll() {
            Column() {
              Row() {
                Column() {
                  Image($r("app.media.pk")).width(60).height(40)
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
                Column() {
                  Image($r("app.media.more")).width(50).height(40)
                  Text("更多").margin(10).fontSize(13)
                }.layoutWeight(1)
                .onClick(()=>{
                  router.pushUrl({
                    url: 'pages/AllappPage',
                  })
                })
              }
              .padding({top:20,bottom:0})
              .margin({top:135})
              .height(100)
              .width("100%")
              .backgroundColor("white")
              .borderRadius(20)

              Row(){
                Column(){
                  Text("智能写作").fontSize(20).position({left:10})
                  Text("快速润色英文，写作也可以很简单")
                    .fontSize(15).fontColor("#CDC9C9")
                    .margin({top:35,left:10})
                }
                Image($r("app.media.xiezuo")).width(60).height(70).margin({left:40})
              }
              .margin({top:20})
              .height(100)
              .width("100%")
              .backgroundColor("white")
              .borderRadius(20)

              Row(){
                Column(){
                  Text("单词练习").fontSize(20).position({x:10,y:-10})
                  Text("听说读写12种练习模式，探索学习")
                    .fontSize(15).fontColor("#CDC9C9")
                    .margin({top:25,left:10})
                  Text("新方式").fontSize(15).fontColor("#CDC9C9")
                    .position({x:10,y:45})
                }
                Image($r("app.media.word")).width(60).height(60).margin({left:40})
              }
              .margin({top:20})
              .height(120)
              .width("100%")
              .backgroundColor("white")
              .borderRadius(20)

              Row(){
                Column(){
                  Text("桌面组件").fontSize(20).position({left:10})
                  Text("新版桌面组件，邀您一同体验")
                    .fontSize(15).fontColor("#CDC9C9")
                    .margin({top:35,left:10})
                }
                Image($r("app.media.zujian")).width(60).height(80)
                  .margin({left:70})
              }
              .margin({top:20})
              .height(100)
              .width("100%")
              .backgroundColor("white")
              .borderRadius(20)

              Row(){
                Column(){
                  Text("词汇量测试").fontSize(20).position({left:10})
                  Text("测一测词汇量，来挑选最适合你的词书")
                    .fontSize(15).fontColor("#CDC9C9")
                    .margin({top:35,left:10})
                }
                Image($r("app.media.cihuiliang")).width(60).height(80)
                  .margin({left:15})
              }
              .margin({top:20})
              .height(100)
              .width("100%")
              .backgroundColor("white")
              .borderRadius(20)

              Text("帮助/反馈 > ").textAlign(TextAlign.Center).margin(30)
                .onClick(()=>{
                  router.pushUrl({
                    url: 'pages/SettingPage',
                  })
                })

            }.width("100%")
            .height("120%")
          }
      }.width("100%")
      .height("100%")

      //底部导航
      Row(){
        Column() {
          Image($r("app.media.select")).width(35).margin({bottom:2})
            .fillColor("#00BFFF")
          Text("查词").fontSize(12)
        }.layoutWeight(1)
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
          Text("我的").fontSize(12)
        }.layoutWeight(1)
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/UserPage',
          })
        })
      }.backgroundColor(Color.White)

    }.backgroundColor("#D3D3D3")
    .width("100%")
    .height("100%")

  }
}