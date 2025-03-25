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
                url: 'pages/StorePage',
              })
            })
          Text("查询历史").fontSize(30).fontWeight(600).position({x:105})
        }.width("95%")
        .margin(10)
        Scroll() {
          List({ space: 15 }) {
            ForEach(this.words, (item: WordTranslation) => {
              ListItem() {
                Text() {
                  Span(item.word).fontSize(25).fontWeight(600)
                  Span('     ' + item.translation).fontSize(15)
                    .fontColor("#00BFFF")
                }
                .maxLines(1)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .margin({ left: 10, right: 8 })
                .borderRadius(10)
              }
            })
          }.width("100%")
          .height("100%")
        }
      }
    }
  }
}