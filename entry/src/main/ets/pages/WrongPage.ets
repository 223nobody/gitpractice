import { router } from '@kit.ArkUI';
import axios, { AxiosError, AxiosResponse } from '@ohos/axios';

interface Result {
  code?: number;
  msg?: string;
  data: Wrong;
}

interface Wrong{
  id?:number,
  yinbiao?:string,
  word?:string,
  translation?:string
}

interface Params {
  id2?: number;
  review?:number;
  num?:number;
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


@Entry
@Component
struct WrongPage {

  @State id2: number = 1; // 初始ID
  @State review: number = 0;
  @State num: number = 0;
  @State mean:string[]=[];
  @State color1: string = "#EEE9E9";
  @State color2: string = "#EEE9E9";
  @State color3: string = "#EEE9E9";
  @State color4: string = "#EEE9E9";
  @State words:WordTranslation[]=[]
  @State wrong:Wrong={
    id:0,
    word:'',
    yinbiao:'',
    translation:''
  }

  aboutToAppear(): void {
    const params = router.getParams() as Params;
    this.id2 = (params && params.id2 !== undefined) ? params.id2 : 1;
    this.num = (params && params.num !== undefined) ? params.num : 0;
    this.review = (params && params.review !== undefined) ? params.review : 0;
    axios.get<Result, AxiosResponse<Result>, Result>(
        'http://localhost:8080/wrong/awrong',
        { params: { id: this.id2+this.num } }
      ).then((data: AxiosResponse<Result>) => {
        this.wrong = data.data.data;
      }).catch((error: AxiosError) => {
        console.error(error.message);
      });
    axios.get<Result1, AxiosResponse<Result1>, Result1>(
      'http://localhost:8080/words2',
    ).then((data: AxiosResponse<Result1>) => {
      this.words=data.data.data
      this.mean = this.words.map(word => word.translation);
      this.insertRandomly(this.wrong.translation!);
    }).catch((error: AxiosError) => {
      console.error(error.message);
    });
  }

  insertRandomly(meaning: string): void {
    const index = Math.floor(Math.random() * (this.mean.length + 1)); // 生成一个随机索引
    this.mean.splice(index, 0, meaning); // 在随机索引处插入 meaning
  }


  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Text(){
            Span("已复习")
            Span(this.id2.toString())
            Span("个，还需复习")
            Span((this.review-this.id2).toString())
            Span("个")
          }.position({ x: 70, y: 13 }).fontSize(20)
        }.width("100%").backgroundColor("#00BFFF").height(50);

        Text(this.wrong.word).fontSize(50).fontWeight(600).margin({ top: 80 });

        Row() {
          Text(this.wrong.yinbiao).margin(10).fontSize(20);
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
              if(this.mean[0]==this.wrong.translation){
                this.color1='#00EE76'
                this.handleMastered()
              }else {
                this.color1='#EE6363'
                this.id2++;
                router.pushUrl({
                  url: 'pages/MeaningPage3',
                  params: { id: this.id2,word: this.wrong.word ,review:this.review,num:this.num}
                });
                if(this.review-this.id2+1==-1){
                  router.pushUrl({
                    url: 'pages/FinishPage',
                  })
                }
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
              if(this.mean[1]==this.wrong.translation){
                this.color2='#00EE76'
                this.handleMastered()
              }else {
                this.color2='#EE6363'
                this.id2++;
                router.pushUrl({
                  url: 'pages/MeaningPage3',
                  params: { id: this.id2,word: this.wrong.word ,review:this.review,num:this.num}
                });
                if(this.review-this.id2+1==0){
                  router.pushUrl({
                    url: 'pages/FinishPage',
                  })
                }
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
              if(this.mean[2]==this.wrong.translation){
                this.color3='#00EE76'
                this.handleMastered()
              }else {
                this.color3='#EE6363'
                this.id2++;
                router.pushUrl({
                  url: 'pages/MeaningPage3',
                  params: { id: this.id2,word: this.wrong.word ,review:this.review,num:this.num}
                });
                if(this.review-this.id2+1==0){
                  router.pushUrl({
                    url: 'pages/FinishPage',
                  })
                }
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
              if(this.mean[3]==this.wrong.translation){
                this.color4='#00EE76'
                this.handleMastered()
              }else {
                this.color4='#EE6363'
                this.id2++;
                router.pushUrl({
                  url: 'pages/MeaningPage3',
                  params: { id: this.id2,word: this.wrong.word ,review:this.review,num:this.num}
                });
                if(this.review-this.id2+1==0){
                  router.pushUrl({
                    url: 'pages/FinishPage',
                  })
                }
              }
            });
        }.margin({ top: 90 });
  //
        Row() {
          Text("已掌握").margin({ top: 20, right: 50 }).fontSize(20).fontColor("#696969")
            .backgroundColor("#1E90FF").borderRadius(8).width(100).height(30)
            .fontColor("white").textAlign(TextAlign.Center).fontSize(20)
            .onClick(() => {
              this.handleMastered();
            });

          Text("不认识").margin({ top: 20 }).fontSize(20).fontColor("#696969")
            .backgroundColor("#1E90FF").borderRadius(8).width(100).height(30)
            .fontColor("white").textAlign(TextAlign.Center).fontSize(20)
            .onClick(() => {
              this.id2++;
              router.pushUrl({
                url: 'pages/MeaningPage3',
                params: { id: this.id2, word: this.wrong.word ,review:this.review,num:this.num}
              });
              if(this.review-this.id2+1==0){
                router.pushUrl({
                  url: 'pages/FinishPage',
                })
              }
            });
        }.margin(10)
      }.width("100%").height("100%");
    };
  }

  handleMastered(): void {
    this.id2++;
    router.pushUrl({
      url: 'pages/WrongPage',
      params: { id2: this.id2, review:this.review,num:this.num }
    });
    if(this.review-this.id2+1==0){
      router.pushUrl({
        url: 'pages/FinishPage',
      })
    }
  }
}

