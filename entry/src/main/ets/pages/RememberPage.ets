import { router } from '@kit.ArkUI';

@Entry
@Component
struct RememberPage {
  @State sum:number=5195
  @State plan:number=200
  @State remember:number=this.plan
  @State strange:number=this.sum
  @State master:number=0
  @State day:number=0

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
          Text("智能背单词").position({x:140,y:5})
        }.width("100%").backgroundColor("white")
        Row(){
          Column(){
            Text("全部").fontSize(15).margin({bottom:10})
            Text(this.sum.toString()).fontSize(25)
          }.layoutWeight(1)
          Column(){
            Text("记忆中").fontSize(15).margin({bottom:10})
            Text(this.remember.toString()).fontSize(25)
          }.layoutWeight(1)
          Column(){
            Text("陌生词").fontSize(15).margin({bottom:10})
            Text(this.strange.toString()).fontSize(25)
          }.layoutWeight(1)
          Column(){
            Text("已掌握").fontSize(15).margin({bottom:10})
            Text(this.master.toString()).fontSize(25)
          }.layoutWeight(1)
        }
        .margin(10)
        .height(80)
        .width("100%")
        .borderRadius(10)
        .backgroundColor("#CDC9C9")

        Row(){
          Column(){
            Text("考研必背5000词").fontSize(18).margin({top:-30,left:40})
            Text(){
              Span("已坚持 ")
              Span(this.day.toString()).fontColor("#00FF00")
              Span("/"+(Math.floor(this.sum/this.plan)+1)+" 天  ")
              Span("更改计划").fontColor("#00BFFF")
                .onClick(()=>{

                })
            }
            .fontSize(15)
            .margin({top:10,left:50})
            Text(this.remember.toString()).fontSize(50).position({x:130,y:50})
            Text("今日剩余任务").fontSize(12).fontColor("#8B8B7A").position({x:138,y:110})
            Button("开始背单词").fontSize(18).fontColor("white").width("80%").height(50).borderRadius(20)
              .backgroundColor("#1E90FF")
              .margin({top:120,left:35})
              .onClick(()=> {

                router.pushUrl({
                  url: 'pages/WordPage',
                })
              })
            Text() {
              Span("今日需学习" + this.plan + "个, 复习" + this.remember + "个")
              }.fontSize(12).position({ x: 100, y: 200 }).fontColor("#8B8B7A")
          }
        }.width("95%")
        .height(300)
        .borderRadius(10)
        .backgroundColor("white")

        Row(){
          Column(){
            Text("学习日历").fontSize(25).position({x:10,y:20})
            Text("查看更多  >").position({x:250,y:25}).fontColor("#8B8B7A")
              // .onClick(()=>{
              //
              // })
            Row(){
              Column(){
                Text("一").fontSize(25).fontColor("#8B8B7A")
                Text("11").fontSize(25).margin({top:10})
              }.layoutWeight(1)
              Column(){
                Text("二").fontSize(25).fontColor("#8B8B7A")
                Text("12").fontSize(25).margin({top:10})
              }.layoutWeight(1)
              Column(){
                Text("三").fontSize(25).fontColor("#8B8B7A")
                Text("13").fontSize(25).margin({top:10})
              }.layoutWeight(1)
              Column(){
                Text("四").fontSize(25).fontColor("#8B8B7A")
                Text("14").fontSize(25).margin({top:10})
              }.layoutWeight(1)
              Column(){
                Text("五").fontSize(25).fontColor("#8B8B7A")
                Text("15").fontSize(25)
                  .backgroundColor("#1E90FF").border({color:"#1E90FF",width:5,radius:100})
              }.layoutWeight(1)
              Column(){
                Text("六").fontSize(25).fontColor("#8B8B7A")
                Text("16").fontSize(25).margin({top:10})
              }.layoutWeight(1)
              Column(){
                Text("日").fontSize(25).fontColor("#8B8B7A")
                Text("17").fontSize(25).margin({top:10})
              }.layoutWeight(1)

            }.margin({top:70})
          }

        }.width("95%")
        .margin(15)
        .height(200)
        .borderRadius(10)
        .backgroundColor("white")


      }.width("100%")
      .height("100%")
    }.backgroundColor("#EEEED1")
  }
}