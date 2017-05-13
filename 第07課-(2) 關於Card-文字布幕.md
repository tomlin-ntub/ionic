# 第07課-(2) 關於Card-文字布幕


#### 執行圖示
![GitHub Logo](/images/fig07-02.jpg)



#### 使用blank樣板(如必要, 請參考第02課):
```
ionic start myApp blank --v2
```


#### home.scss
```
page-home {  
    .card-background-page {
        ion-card {
            position: relative;
            height:200px;            
        }

        ion-card div.img{
            height:200px;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;           
        }

        ion-card div.message{
            position:absolute;
            bottom:0;
            width:100%;
            height:55px;
            text-align:center;
            background:rgba(0, 0, 0, 0.5);
        }

        .card-title {      
            top: 36%;
            font-size: 2.0em;
            width: 100%;
            font-weight: bold;
            color: #fff;
        }
        
        .card-subtitle {
            font-size: 1.0em;            
            top: 52%;
            width: 100%;
            color: #fff;
        }
    }    
}

```



#### 本測試使用內容如下:
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
                 |___ <assets> 
                 |       |___ <images> 
                 |               |___ a1.jpg (80*80px) 
                 |               |___ a2.jpg (80*80px) 
                 |               |___ a3.jpg (80*80px) 
                 |               |___ a4.jpg (80*80px)                  
                 |                 
                 |___ <pages>   
                 |       |___ <home> 
                 |              |___ home.html 
                 |              |___ home.ts                          
                 |              |___ home.scss 
                 |
                 |___ <theme>   
                         |___ variables.scss
```


#### 下載
下載/ionic-測試-07-2.zip

