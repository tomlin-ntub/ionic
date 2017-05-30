# 第10課-(1) 資料庫-回傳JSON-美食


#### (1) 準備資料庫, 名稱:foodDB
```
下載\foods.sql
```


#### (2) 建立網站
```
express myWeb -ejs
```


#### (3) 增加外掛
```
npm install mysql --save
npm install cors --save
```


#### (4)下載樣板網站, 解壓縮後複製到<myWeb>資料夾中(取代舊檔案):
```
下載\myWeb-10-1.zip
```


#### db.js
```
var mysql = require('mysql');

//------------------------
// 建立資料庫連線池
//------------------------
var pool  = mysql.createPool({
    user: 'root',
    password: 'mysql',
    host: '127.0.0.1',
    database: 'fooddb', 
    waitForConnections : true, 
    connectionLimit : 10       
});

//----------------------------
// 引用此模組時將匯出pool物件
//----------------------------
module.exports = pool;
```


#### index.js
```
var express = require('express');
var router = express.Router();
var mysql = require('mysql');
//------------------
// 載入資料庫連結
//------------------
var pool = require('./lib/db.js');

//------------------
// 回應GET請求
//------------------
router.get('/', function(req, res, next) {
    sendData(req, res);	
});

//------------------
// 回應POST請求
//------------------
router.post('/', function(req, res, next) {
    sendData(req, res);			
});


//---------------------------
// 回傳資料
//---------------------------
function sendData(req, res){
    //------------------------
    // 改成自己的主機位址
    //------------------------
    var url="http://192.16.56.1/images/";	
	
    //------------------------
    // 從資料庫擷取資料
    //------------------------	
    pool.query('select * from foods', function (error, results, fields) {
        var data=[];
		
        if (error){
            res.json(data);  // 回傳空資料		
        }else{
            for(var i=0; i<results.length; i++){
                var food={};
                food.name=results[i].name;
                food.city=results[i].city;
                food.lat=results[i].lat;
                food.lng=results[i].lng;		
                food.author=results[i].author;
                food.comment=results[i].comment;
                food.like=results[i].like;
                food.reply=results[i].reply;
                food.lastUpdate=results[i].lastUpdate;
                food.imgURL=url+results[i].imgURL;
                food.authorImgURL=url+results[i].authorImgURL;
                food.thumbnail=url+results[i].thumbnail;
                data.push(food);		
            }
            res.json(data);    // 將資料以JSON格式回傳
        }       
    });
}		

module.exports = router;
```
