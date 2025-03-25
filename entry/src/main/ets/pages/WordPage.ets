import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';

interface Result {
  code?: number;
  msg?: string;
  data: Remember;
}
interface Wrong{
  word?:string,
  yinbiao?:string,
  translation?:string
}
interface Result1 {
  code?: number;
  msg?: string;
  data: WordTranslation[]
}
interface WordTranslation {
  word: string;
  translation: string;
}
interface Remember {
  id: number;
  word: string;
  yinbiao: string;
  meaning: string;
}
interface Params {
  id1?: number;
  review: number
}
interface Result2{
  code?:number,
  msg?:string,
  data:number
}

@Entry
@Component
struct WordPage {
  @State remain: number = 20;
  @State review: number = 0;
  @State id1: number = 1; // 初始ID
  @State num:number=0;
  @State color1: string = "#EEE9E9";
  @State color2: string = "#EEE9E9";
  @State color3: string = "#EEE9E9";
  @State color4: string = "#EEE9E9";
  @State mean:string[]=[];
  @State remember: Remember = {
    id: 0,
    word: '',
    yinbiao: '',
    meaning:''
  };
  @State words:WordTranslation[]=[]

  aboutToAppear(): void {
    // 使用类型断言
    const params = router.getParams() as Params;
    this.id1 = (params && params.id1 !== undefined) ? params.id1 : 1;
    this.review = (params && params.review !== undefined) ? params.review : 0;
    this.fetchWordData();
  }

  fetchWordData(): void {
    axios.get<Result, AxiosResponse<Result>, Result>(
      'http://localhost:8080/remember',
      { params: { id: this.id1 } }
    ).then((data: AxiosResponse<Result>) => {
      this.remember = data.data.data;
    }).catch((error: AxiosError) => {
      console.error(error.message);
    });
    axios.get<Result1, AxiosResponse<Result1>, Result1>(
      'http://localhost:8080/words2',
    ).then((data: AxiosResponse<Result1>) => {
      this.words=data.data.data
      this.mean = this.words.map(word => word.translation);
      this.insertRandomly(this.remember.meaning);
    }).catch((error: AxiosError) => {
      console.error(error.message);
    });
    axios.get<Result, AxiosResponse<Result2>, Result2>(
      'http://localhost:8080/wrong/MaxId',
    ).then((data: AxiosResponse<Result2>) => {
      this.num=data.data.data-this.review
    }).catch((error: AxiosError) => {
      console.error(error.message);
    })
  }

  insertRandomly(meaning: string): void {
    const index = Math.floor(Math.random() * (this.mean.length + 1)); // 生成一个随机索引
    this.mean.splice(index, 0, meaning); // 在随机索引处插入 meaning
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Image($r("app.media.back")).width(30)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/RememberPage',
              });
            });
          Text(){
            Span("还需学习 ")
            Span((this.remain-this.id1).toString()).fontColor("white")
            Span(" 个, 复习 ")
            Span(this.review.toString()).fontColor("red")
            Span(" 个")
          }.position({ x: 75, y: 13 }).fontSize(20)

        }.width("100%").backgroundColor("#00BFFF").height(50);

        Text(this.remember.word).fontSize(50).fontWeight(600).margin({ top: 80 });

        Row() {
          Text(this.remember.yinbiao).margin(10).fontSize(20);
          Image($r('app.media.sound')).fillColor("#00BFFF").width(40);
        }.margin(10);

        Column() {
          Text(this.mean[0])
            .width("90%")
            .textAlign(TextAlign.Center)
            .height(60)
            .borderRadius(10)
            .margin(5)
            .fontSize(18)
            .onClick(() => {
              if(this.mean[0]==this.remember.meaning){
                this.color1='#00EE76'
                this.handleMastered()
                this.toreview()
              }else {
                this.color1='#EE6363'
                this.review++
                this.id1++;
                router.pushUrl({
                  url: 'pages/MeaningPage2',
                  params: { review:this.review,id: this.id1,word: this.remember.word }
                });
                axios.post<Result, AxiosResponse<Result>, Wrong>(
                  'http://localhost:8080/wrong',
                  {},
                  {params:{word:this.remember.word,
                    yinbiao:this.remember.yinbiao,
                    translation:this.remember.meaning}}
                ).catch((error: AxiosError) => {
                  console.error("Error adding wrong:", error.response?.data, error.message);
                })
                this.toreview()
              }
            })
            .backgroundColor(this.color1);

          Text(this.mean[1])
            .backgroundColor(this.color2)
            .width("90%")
            .textAlign(TextAlign.Center)
            .height(60)
            .borderRadius(10)
            .margin(5)
            .fontSize(18)
            .onClick(() => {
              if(this.mean[1]==this.remember.meaning){
                this.color2='#00EE76'
                this.handleMastered()
                this.toreview()
              }else {
                this.color2='#EE6363'
                this.review++
                this.id1++;
                router.pushUrl({
                  url: 'pages/MeaningPage2',
                  params: { review:this.review,id: this.id1,word: this.remember.word }
                });
                axios.post<Result, AxiosResponse<Result>, Wrong>(
                  'http://localhost:8080/wrong',
                  {},
                  {params:{word:this.remember.word,
                    yinbiao:this.remember.yinbiao,
                    translation:this.remember.meaning}}
                ).catch((error: AxiosError) => {
                  console.error("Error adding wrong:", error.response?.data, error.message);
                })
                this.toreview()
              }
            });

          Text(this.mean[2])
            .backgroundColor(this.color3)
            .width("90%")
            .textAlign(TextAlign.Center)
            .height(60)
            .borderRadius(10)
            .margin(5)
            .fontSize(18)
            .onClick(() => {
              if(this.mean[2]==this.remember.meaning){
                this.color3='#00EE76'
                this.handleMastered()
                this.toreview()
              }else {
                this.color3='#EE6363'
                this.review++
                this.id1++;
                router.pushUrl({
                  url: 'pages/MeaningPage2',
                  params: { review:this.review,id: this.id1,word: this.remember.word }
                });
                axios.post<Result, AxiosResponse<Result>, Wrong>(
                  'http://localhost:8080/wrong',
                  {},
                  {params:{word:this.remember.word,
                    yinbiao:this.remember.yinbiao,
                    translation:this.remember.meaning}}
                ).catch((error: AxiosError) => {
                  console.error("Error adding wrong:", error.response?.data, error.message);
                })
                this.toreview()
              }
            });

          Text(this.mean[3])
            .backgroundColor(this.color4)
            .width("90%")
            .textAlign(TextAlign.Center)
            .height(60)
            .borderRadius(10)
            .margin(5)
            .fontSize(18)
            .onClick(() => {
              if(this.mean[3]==this.remember.meaning){
                this.color4='#00EE76'
                this.handleMastered()
                this.toreview()
              }else {
                this.color4='#EE6363'
                this.review++
                this.id1++;
                router.pushUrl({
                  url: 'pages/MeaningPage2',
                  params: { review:this.review,id: this.id1,word: this.remember.word }
                });
                axios.post<Result, AxiosResponse<Result>, Wrong>(
                  'http://localhost:8080/wrong',
                  {},
                  {params:{word:this.remember.word,
                    yinbiao:this.remember.yinbiao,
                    translation:this.remember.meaning}}
                ).catch((error: AxiosError) => {
                  console.error("Error adding wrong:", error.response?.data, error.message);
                })
                this.toreview()
              }
            });
        }.margin({ top: 80 });

        Row() {
          Text("已掌握").margin({ top: 20, right: 50 }).fontSize(20).fontColor("#696969")
            .backgroundColor("#1E90FF").borderRadius(8).width(100).height(30)
            .fontColor("white").textAlign(TextAlign.Center).fontSize(20)
            .onClick(() => {
              this.handleMastered()
              this.toreview()
            });

          Text("不认识").margin({ top: 20 }).fontSize(20).fontColor("#696969")
            .backgroundColor("#1E90FF").borderRadius(8).width(100).height(30)
            .fontColor("white").textAlign(TextAlign.Center).fontSize(20)
            .onClick(() => {
              this.id1++;
              this.review++;
              router.pushUrl({
                url: 'pages/MeaningPage2',
                params: { review:this.review,id: this.id1,word: this.remember.word }
              });
              axios.post<Result, AxiosResponse<Result>, Wrong>(
                'http://localhost:8080/wrong',
                {},
                {params:{word:this.remember.word,
                  yinbiao:this.remember.yinbiao,
                  translation:this.remember.meaning}}
              ).catch((error: AxiosError) => {
                console.error("Error adding wrong:", error.response?.data, error.message);
              })
              this.toreview()
            });
        }.margin(10)
      }.width("100%").height("100%");
    };
  }

  handleMastered(): void {
    this.id1++;
    router.pushUrl({
      url: 'pages/WordPage',
      params: { id1: this.id1,review:this.review }
    });
  }
  toreview(): void {
   if(this.id1==this.remain){
     router.pushUrl({
       url: 'pages/WrongPage',
       params: { review:this.review, num:this.num}
     });
   }
  }
}

