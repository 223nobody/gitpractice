import { router } from '@kit.ArkUI';

@Entry
@Component
struct FinishPage {
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
            Text("考研必背5000词").fontSize(18).margin({top:-80,left:80})
            Text(){
              Span("已坚持 ")
              Span(this.day.toString()).fontColor("#00FF00")
              Span("/"+(Math.floor(this.sum/this.plan)+1)+" 天  ")
              Span("更改计划").fontColor("#00BFFF")
                .onClick(()=>{

                })
            }
            .fontSize(15)
            .margin({top:10,left:90})
            Image($r("app.media.wancheng")).width(120).margin({left:80})

            Text("任务完成").fontSize(20).position({x:130,y:90})
            Text("恭喜你完成今天"+this.remember.toString()+"个单词").
            fontSize(12).position({x:100,y:120}).fontColor("#8B8B7A")
            Row({space:10}){
              Button("重新学习").backgroundColor('white')
                .fontColor('black').width(120).fontSize(14).borderColor("#CDC9C9").borderWidth(1)
              Button("分享今日成绩").backgroundColor("#00BFFF")
                .width(120).fontSize(14)
            }.position({x:48,y:150})
          }
        }.width("95%")
        .height(320)
        .borderRadius(10)
        .backgroundColor("white")

        Row(){
          Column(){
            Text("学习日历").fontSize(25).position({x:10,y:20})
            Text("查看更多  >").position({x:250,y:25}).fontColor("#8B8B7A")
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

