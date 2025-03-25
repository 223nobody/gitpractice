import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';

interface Result{
  code?:number,
  msg?:string,
  data:WordTranslation[]
}
interface WordTranslation {
  word: string;
  translation: string;
}
@Entry
@Component
struct SelectPage {
  @State words:WordTranslation[]=[]
  @State word:string=''

  aboutToAppear(): void {
    axios.get<Result, AxiosResponse<Result>, Result>(
      'http://localhost:8080/history',
    ).then((data: AxiosResponse<Result>) => {
      this.words=data.data.data
    }).catch((error: AxiosError) => {
      console.error(error.message);
    })
  }

  build() {
    Row() {
      Column(){
        Row() {
          Image($r("app.media.back")).width(30)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/HomePage',
              })
            })
          Image($r("app.media.select")).width(30)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/MeaningPage',
                params:{word:this.word}
              })
            })
          TextInput({ placeholder: "请输入您想要搜索的内容" })
            .onChange((value)=>{
              this.word=value;
            })
            .fontColor("#696969")
        }
        .margin(20)
        .borderRadius(8)
        .width("95%")
        .height(40)
        .backgroundColor("#EEE9E9")
        .zIndex(100)

        Text("查询历史")

        Scroll() {
          List({ space: 20 }) {
            ForEach(this.words.slice(0, 15), (item: WordTranslation) => {
              ListItem() {
                Text() {
                  Span(item.word).fontSize(25).fontWeight(600)
                  Span('     ' + item.translation).fontSize(15)
                    .fontColor("#00BFFF")
                }
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .margin({ left: 10, right: 8 })
                .backgroundColor("#EEE9E9")
                .borderRadius(10)
              }
            })
          }.width("100%")
          .height("120%")
        }
      }
    }
  }
}