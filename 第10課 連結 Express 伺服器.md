# 第10課 連結 Express 伺服器



#### 執行圖示
![GitHub Logo](/images/fig10-01.jpg)



#### (網站部份)建立Express網站, 名稱為 myWeb:
```
express myWeb -ejs
cd myWeb
npm install
```


#### (網站部份)追加外一個外掛, cors:
```
npm install cors --save
```


#### (網站部份)下載樣板網站, 解壓縮後複製到<myWeb>資料夾中(取代舊檔案):
```
下載\myWeb-測試-10.zip
```



#### (App部份)建立一個App, 名稱為 myApp:
```
ionic start myApp blank --save
```


#### (App部份)追加一個服務, 名稱為 BookService:
```
cd myApp
ionic g provider BookService
```


#### (App部份)下載樣板程式, 解壓縮後複製到<myApp>資料夾中(取代舊檔案):
```
下載\ionic-測試-10.zip
```

#### (App部份)本測試使用內容如下:
```
 d:\
  |___ <myApp> 
          |___ config.xml 
          |
          |___ <resources>     
          |      |___ <android>  
          |               |___ <icon>
          |               |      |___ 多個.png圖檔          
          |               | 
          |               |___ <splash> 
          |                      |___ 多個.png圖檔              
          |               
          |___ <src>
                 |___ <app> 
                 |       |___ app.module.ts
                 |                 
                 |___ <pages>   
                 |       |___ <home> 
                 |              |___ home.html 
                 |              |___ home.ts   
                 |
                 |___ <providers>   
                 |       |___ book-service.ts                
                 |
                 |___ <theme>   
                         |___ variables.scss
```

