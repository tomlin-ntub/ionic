# 第15課-(1) 加入Provider


#### 如在Chrome中執行模擬器, 先安裝Chrome Extension: Allow-Control-Allow_Origin


#### 執行圖示
![GitHub Logo](/images/fig15-01.jpg)



## 資料庫部份

#### (1)建立一個MySQL的foodDB資料庫, 資料表可下載:
```
下載\foods.sql
```



## 網站部份

#### (1)建立Express網站, 名稱為 myWeb:
```
express myWeb -ejs
cd myWeb
npm install
```


#### (2)追加外掛:
```
npm install mysql --save
npm install cors --save
```


#### (3)下載樣板網站, 解壓縮後複製到<myWeb>資料夾中(取代舊檔案):
```
下載\myWeb-15-1.zip
```

#### (4)網站簡易架構
```
 d:\
  |___ <myWeb>           
          |___ <public>
                 |___ app.js
                 |                 
                 |___ <routes>   
                         |___ <lib>
                         |      |___ db.js (資料庫連線設定)
                         |                          
                         |___ index.js                        
```



## App部份

#### (1)建立一個App, 名稱為 myApp:
```
ionic start myApp blank --save
```


#### (2)加入一個provider, 名稱為myService:
```
ionic g provider myService
```


#### (3)下載樣板程式, 解壓縮後複製到<myApp>資料夾中(取代舊檔案):
```
下載\ionic-測試-15-1.zip
```



#### (4.1) app.module.ts (增加匯入 HttpModule及MyService)
```javascript
import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';

import { HttpModule } from '@angular/http';                /* 增加 */
import { MyService } from '../providers/my-service';       /* 增加 */

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';

@NgModule({
  declarations: [
    MyApp,
    HomePage
  ],
  imports: [
    BrowserModule,
    HttpModule,    /* 增加 */    
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage
  ],
  providers: [
    StatusBar,
    SplashScreen,
    MyService,     /* 增加 */  
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {}
```


#### (4.2) home.ts
```javascript
import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { AlertController } from 'ionic-angular';
import { MyService } from '../../providers/my-service';

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {
    //----------------------------------
    // 成員     
    //----------------------------------    
    items:any;
    city:string="台北";

    //----------------------------------
    // 建構元    
    //----------------------------------    
    constructor(public navCtrl: NavController, 
      public alertCtrl: AlertController,
      private myService: MyService) {
        this.loadData(this.city);
    }


    //----------------------------------
    // 讀取主機資料
    //----------------------------------            
    loadData(city){
        this.myService.load(city).then(
            (results) => {  
                if(results==-1){
                    this.showAlert();
                    return;
                }else{                                          
                    this.items = results;
                    if(this.items.length==0){
                        this.showNotFound();
                        return;
                    }
                }    
            }
        );
    }


    //----------------------------------
    // 顯示讀取失敗訊息
    //----------------------------------
    showAlert() {
        let alert = this.alertCtrl.create({
            title: '資料取得失敗!',
            subTitle: '請確定網路狀態, 或是主機是否提供服務中.',
            buttons: ['OK']
        });
        alert.present();
    }
    //----------------------------------


    //----------------------------------
    // 顯示無符合資料訊息
    //----------------------------------
    showNotFound() {
        let alert = this.alertCtrl.create({
            title: '無符合資料!',
            subTitle: '目前資料庫無符合條件的資料.',
            buttons: ['OK']
        });
        alert.present();
    }
    //----------------------------------    
}
```

#### (4.3) home.html
```html
<ion-header>
  <ion-navbar>
    <ion-title>
      Ionic Blank
    </ion-title>
  </ion-navbar>
</ion-header>

<ion-content>  
  <!-- .................................. -->  
  <div>
    <ion-segment>
      <ion-segment-button (click)="loadData('台北')">
        台北
      </ion-segment-button>
      <ion-segment-button (click)="loadData('台南')">
        台南
      </ion-segment-button>
      <ion-segment-button (click)="loadData('彰化')">
        彰化
      </ion-segment-button>
      <ion-segment-button (click)="loadData('宜蘭')">
        宜蘭
      </ion-segment-button>  
      <ion-segment-button (click)="loadData('高雄')">
        高雄
      </ion-segment-button>                            
    </ion-segment>
  </div>
  <!-- .................................. -->
  <ion-list>
    <ion-item *ngFor="let item of items">
      <ion-thumbnail item-left>
        <img src="{{item.thumbnail}}">
      </ion-thumbnail>
      <h2>{{item.name}}</h2>
      <p>{{item.author}}</p>		
    </ion-item>
  </ion-list>
  <!-- .................................. -->	
</ion-content>
```


#### (4.4) my-service.ts
```javascript
import { Injectable } from '@angular/core';
import { Http, URLSearchParams } from '@angular/http';  /* 加入 URLSearchParams */
import 'rxjs/add/operator/map';


@Injectable()
export class MyService {
    //-------------------------
    // 建構元
    //-------------------------
    constructor(public http: Http) {}

    //-------------------------------------
    // 載入資料函式
    //-------------------------------------
    load(city){
        return new Promise(resolve => {
            // 傳給主機的參數
            let params: URLSearchParams = new URLSearchParams();
            params.set('city', city);    

            // 修改主機位址
            this.http.get('http://192.168.56.1', {search: params})	
                .map(res => res.json())
                .subscribe(
                    (data) => {                           
                        resolve(data);  //成功取回資料                              
                    },
                    (err) => {
                        resolve(-1);    //取回資料失敗
                    }
                );
            });
    }
    //-------------------------------------
}
```




#### (5)手機簡易架構:
```
 d:\
  |___ <myApp>                                      
          |___ <src>
                 |___ <app> 
                 |       |___ app.module.ts (增加引用HttpModule及MyService)
                 |                 
                 |___ <pages>   
                 |       |___ <home> 
                 |              |___ home.html 
                 |              |___ home.ts     
                 |                 
                 |___ <providers>   
                         |___ my-service.ts                                
```

