import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';

interface Param{
  word:string,
}
interface Result{
  code?:number,
  msg?:string,
  data?:string,
}
interface History{
  word:string,
  translation:string
}
@Entry
@Component
struct MeaningPage {
  @State params:Param = {
    word:''
  }
  @State meaning:string=''

  aboutToAppear(): void {
    this.params = router.getParams() as Param
    axios.get<Result, AxiosResponse<Result>, Result>(
      'http://localhost:8080/words',
      {params:{word:this.params.word}}
    ).then((data: AxiosResponse<Result>) => {
      if(data.data.data!=undefined){
        this.meaning=data.data.data
      }
    }).catch((error: AxiosError) => {
      console.error(error.message);
    })
  }

    build() {
    Row(){
      Column(){
        Row() {
          Image($r("app.media.back")).width(30)
            .onClick(() => {
              axios.post<Result, AxiosResponse<Result>, History>(
                'http://localhost:8080/history',
                {
                  word: this.params.word,
                  translation: this.meaning
                }
              ).then((data: AxiosResponse<Result>) => {
                console.info("History added:", data);
              }).catch((error: AxiosError) => {
                console.error("Error adding history:", error.response?.data, error.message);
              });
              router.pushUrl({
                url: 'pages/HomePage',
              })
            })
            Row()
            {
              Text("     "+this.params.word)
              }.backgroundColor("#EEE9E9")
              .borderRadius(8)
              .width("85%")
              .height(40)
              .margin({left:8})
          }.backgroundColor("white")
        .borderRadius(8)

        Scroll(){
          Column(){
              Column(){
                Text(this.params.word).fontSize(35).fontWeight(600).position({x:20,y:20})
                Text("CET4 / CET6 / 考研 / GRE / TOEFL").position({x:20,y:80}).fontSize(17)
                Text("英 / ").position({x:20,y:110}).fontSize(17)
                Text("美 / ").position({x:20,y:140}).fontSize(17)
                Text("发音教练 >").position({x:20,y:170}).fontColor("#00BFFF").fontSize(14)
                  .backgroundColor("#EEE9E9").borderRadius(8).width(75).height(20)
              }
              .backgroundColor("white")
              .width("90%")
              .height(200)
              .borderRadius(20)
              .margin({top:15})
              Column(){
                Text("常用释义").fontSize(25).fontWeight(600).position({x:20,y:20})
                Text(this.meaning).position({x:20,y:60})
              }.width("90%")
              .height(150)
              .borderRadius(20)
              .margin({top:15})
              .backgroundColor("white")
            Column(){
              Text("词态变化").fontSize(25).fontWeight(600).position({x:20,y:20})
              Text()
            }.width("90%")
            .height(150)
            .borderRadius(20)
            .margin({top:15})
            .backgroundColor("white")

            Column(){
              Text("实用场景例句").fontSize(25).fontWeight(600).position({x:20,y:20})
              Text()
            }.width("90%")
            .height(250)
            .borderRadius(20)
            .margin({top:15})
            .backgroundColor("white")

            Column(){
              Text("词根词缀").fontSize(25).fontWeight(600).position({x:20,y:20})
              Text()
            }.width("90%")
            .height(250)
            .borderRadius(20)
            .margin({top:15})
            .backgroundColor("white")
            }.width("100%")
          .height("180%")
        }.width("100%")



        }.width("100%")
      .height("100%")
      .backgroundColor("#D3D3D3")
      }

    }
}