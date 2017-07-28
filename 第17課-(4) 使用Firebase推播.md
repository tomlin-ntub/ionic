# 第17課-(4) 使用Firebase推播 (Express --> Firebase --> 手機)



## 資料庫部份

#### (1)建立一個myDB資料庫, 內有register及unregister資料表.
```

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `register`
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register` (
  `serNo` int(11) NOT NULL AUTO_INCREMENT,
  `token` text COLLATE utf8_unicode_ci,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of register
-- ----------------------------

-- ----------------------------
-- Table structure for `unregister`
-- ----------------------------
DROP TABLE IF EXISTS `unregister`;
CREATE TABLE `unregister` (
  `serNo` int(11) NOT NULL AUTO_INCREMENT,
  `token` text COLLATE utf8_unicode_ci,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of unregister
-- ----------------------------

```



## Express部份

#### (1)建立一個Express網站, 名稱為 myWeb:
```
express myWeb -ejs
cd myWeb
npm install
```


#### (2)增加以下外掛
```
npm install fcm-push --save
npm install mysql --save
```


#### (3)db.js
```javascript
var mysql = require('mysql');

//------------------------
// 建立資料庫連線池
//------------------------
var pool  = mysql.createPool({
    user: 'root',
    password: 'mysql',
    host: '127.0.0.1',
    database: 'mydb', 
    waitForConnections : true, 
    connectionLimit : 10       
});

//----------------------------
// 引用此模組時將匯出pool物件
//----------------------------
module.exports = pool;
```



#### (4)index.js
```javascript
var express = require('express');
var router = express.Router();

//---------------------------------------
// 在command模式中加入外掛, 如下:
// npm install fcm-push --save
//---------------------------------------
var FCM = require('fcm-push');


//---------------------------------------------------------------------------------
// 在 https://console.firebase.google.com/ 中,
// 已建立的Firebase專案中 -> 選 CLOUD MESSAGING -> 內有 "伺服器金鑰"
//---------------------------------------------------------------------------------
var serverKey = 'AAAANR_Y_FQ:APA91bExWnFBja9cOTwJavSKd6rfywUxNSwZXwLYXjqOYb_ek2iAIuZutgU7-_Dd4X-plIoZU85GYkGdsg-EBDX-Au9ju3vbkCkqDpcY1YMBhf7AESF_8U6su5bULPVc9EGOx97pQvb0';
var fcm = new FCM(serverKey);


//------------------
// 載入資料庫連結
//------------------
var pool = require('./lib/db.js');


//--------------------------------------------------------
// 等待get請求
//--------------------------------------------------------
router.get('/', function(req, res, next) {	
	// 取得工作代碼及內容
	var code=req.param('code');
	var content=req.param('content');
	

	//===============================
	// 工作代碼為1時: 
	// 儲存手機傳來的token
	//===============================
	if(code==1){
		// 取得使用者傳來的參數		
		var token=content;
		var timestamp=new Date();
		
		
		// 建立一個新資料物件
		var newData={
			token:token,
			timestamp:timestamp
		}	
		
		// 將Token寫入資料庫
		pool.query('INSERT INTO register SET ?', newData, function(err, rows, fields) {
			if (err){
				console.log('新增失敗');
			}else{
				console.log('新增成功');
			}
		});
		
		// 回傳訊息給連接設備
		data=[{'code':'0'}];	
		res.json(data);
	}
		
	
	//=========================================================
	// 工作代碼為2時: 	
	// 傳送通知給所有的連接設備
	// 傳送範例 http://主機位址?code=2;content=你好
	//=========================================================
	if(code==2){
		// 取得使用者傳來的參數	
		var msg=content;
		
		
		// 取得資料庫中的Token
		pool.query('SELECT * FROM register', function (error, results, fields) {
			if (error){
				console.log('資料取出失敗');
				return;
			}else{				
				for (var i=0; i<results.length; i++){						
					var message = {
						to: results[i].token, 
						collapse_key: '001', 
						notification: {
							title: '我的通知',
							body: msg
						}
					};	

					sendNotification(message);
				}       
			}
		})

		res.render('index', { title: '通知已傳送'});
	}
	
	
	//===============================
	// 推播函式
	//===============================	
	function sendNotification(message) {
		var msg=message;

		fcm.send(msg, function(err, response){
			//===========================
			// 如果推播失敗
			//===========================
			if (err) {								
				console.log('--------------------------');
				console.log('通知傳送失敗:'+msg.to);

							
				//建立一個新資料物件
				var timestamp=new Date();				
				
				var newData={
					token:msg.to,
					timestamp:timestamp
				}	

				// 寫入無效Token資料表
				pool.query('INSERT INTO unregister SET ?', newData, function(err, rows, fields) {
					if (err) {
						throw err;
					}
				});
			}

			//===========================
			// 如果推播成功
			//===========================			
			if(response){
				console.log('--------------------------');
				console.log('通知傳送成功:'+message.to);
			}
		});
	}
	//===============================	
});

module.exports = router;
```

#### (5)網站路徑如下:
```
 d:\
  |___ <myWeb>   
          |___ <routes>
                 |___ index.js
                 |
                 |___ <lib>             
                        |___ db.js
```

