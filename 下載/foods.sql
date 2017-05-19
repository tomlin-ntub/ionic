/*
Navicat MySQL Data Transfer

Source Server         : case
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : fooddb

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-05-19 16:24:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `foods`
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `like` int(10) DEFAULT NULL,
  `reply` int(10) DEFAULT NULL,
  `lastUpdate` date DEFAULT NULL,
  `imgURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorImgURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES ('1', '小江戶日式和漢料理', '若水漣漪', '胡麻魚卵細麵，本來不打算吃主食，但還是點了這一道，夏天沒什麼胃口，吃點冷麵也是不錯的選擇，沒想到意外挖到寶！這道是當天最讓我印象深刻的一道，大量的魚卵鋪在細麵上，與白色細麵、綠色蔬菜倒是搭配出很和諧的顏色，不只視覺吸睛，味道也很厲害！', '5', '10', '2017-04-17', 'a1.jpg', 'b1.jpg', 't1.jpg');
INSERT INTO `foods` VALUES ('2', '瑪莎露露 有機蔬菜', '捲捲頭品味生活', '瑪莎露露是東區崇德路起家的吃到飽火鍋店，主打有機蔬菜、自然豬等生機食材，而樂活團也在2015年6月份時開團過，之後他們在仁德特力屋開了火鍋+生機教室的分店，也就是今天要介紹的瑪莎露露仁德店', '8', '12', '2017-05-01', 'a2.jpg', 'b2.jpg', 't2.jpg');
INSERT INTO `foods` VALUES ('3', '歐泰小廚', 'drsharry', '多年過去，他還是老樣子，對料理的要求很高。為求完美，在他料理的過程中，為了避免忽略什麼小細節，他都是全神貫注、心無旁鶩，在這種時候跟他講話，他不是沒聽到就是必須暫時先不回應你，對料理的堅持、顧及消費者的權益，那股久違懷念的感覺，一下子都湧上了心頭。', '3', '18', '2017-04-21', 'a3.jpg', 'b3.jpg', 't3.jpg');
INSERT INTO `foods` VALUES ('4', '小豆豆鍋燒意麵', 'nikudiary', '小豆豆，這名字充滿童趣，想必是許多台南人小時候的回憶。聽枕邊人說，他從小吃到大，味道還不賴，既然土身土長的台南人都推薦了，趁著獨自在台南亂晃的機會就去瞧瞧吧。其實來台南好幾次，也經過它很多遍，只是門口總是充斥人群，每每看到長長人籠，即便人都走到了玻璃門前，我還是寧願選擇放棄。', '12', '22', '2017-04-10', 'a4.jpg', 'b4.jpg', 't4.jpg');
INSERT INTO `foods` VALUES ('5', '過溝仔肉圓王', 'carol', '對於肉圓的印象一直停留在早期出遊的日子，那時要去南投玩，總會經過大竹肉圓，再往省道14號出發。我還記得那時剛吃大竹肉圓的時候，一顆只有20元。事過境遷，反倒是這幾年 在外地生活後，回到彰化時，總會想多嚐嚐這些好久不見的鄉土小吃。肉圓其實簡單，好吃不過有四，即為外皮、內餡、醬料及高湯而已。', '2', '5', '2017-05-04', 'a5.jpg', 'b5.jpg', 't5.jpg');
INSERT INTO `foods` VALUES ('6', '賀豆韓食 韓國料理', '小久保', '去年吃過台中的高麗屋後，便尋思著彰化有沒有類似這樣的餐廳。問了問住在彰南路附近的朋友，他便跟我推薦這間。「份量還算可以，味道還好。」他對我這樣說。在台灣及日本，吃了不少家韓國料理之後，便有了一些心得。首先，道地不見得大家都覺得好吃，而經過改良後也不見得會變得難吃。論道地程度上，是無論如何都比不上在韓國的餐廳，就算新大久保的店也一樣。', '2', '7', '2017-05-10', 'a6.jpg', 'b6.jpg', 't6.jpg');
INSERT INTO `foods` VALUES ('7', '斑比咖啡 Bambi Bambi Brunch', 'Bernice 小芬', 'Bambi Bambi Brunch斑比咖啡位於捷運台電大樓附近的小巷弄內 位置鬧中取靜,是個放鬆、休閒、跟姊妹滔談天說地聚會的好場所 一進門就看到特別加蓋出來的鐵皮屋,裡面佈置的溫馨又童趣 右手邊入門就是兩個大廳的坐位區,但大家都比較喜歡坐在外面,這裡畢竟有可愛的斑比相伴', '4', '16', '2017-05-05', 'a7.jpg', 'b7.jpg', 't7.jpg');
INSERT INTO `foods` VALUES ('8', '披薩斜塔', '西西漫走筆記', '繼上次在披薩斜塔吃過披薩餃和夏威夷披薩後超驚豔!這次下午來嚐嚐他的甜披薩，這份香蕉巧克力口味的甜披薩份量不小，兩個人合吃綽綽有餘，香蕉和巧克力的香氣濃郁又合拍，餅皮Q彈不油膩，相當好吃，瑪格莉特披薩，用上好的番茄醬汁和新鮮番茄當作主角，起司香氣濃郁，加上羅勒香氣提味，讓這份配料簡單的披薩意外的好吃!', '34', '129', '2017-05-03', 'a8.jpg', 'b8.jpg', 't8.jpg');
INSERT INTO `foods` VALUES ('9', '里海咖啡/里海café', 'ayeu0406', '晚餐時間還是得開車到礁溪車站附近覓食 之前看到其他人分享里海咖啡的餐點 很吸引人 所以難得來礁溪住一晚 就馬上預定晚餐來里海咖啡用餐拉 里海咖啡其實離礁溪車站主要熱鬧區域有一大段距離 而里海咖啡附近喜互惠超市前有一大塊空地 是挺方便停車的 里海咖啡外觀算是相當低調 若是沒特別注意 真的會不小心miss掉', '4', '55', '2017-05-02', 'a9.jpg', 'b9.jpg', 't9.jpg');
INSERT INTO `foods` VALUES ('10', '宜蘭【Dew 36 綻露】 coffee elite', 'peonykey', '請給我來一杯。不要忽略貓咪的請求~~~【Dew 36 綻露 】coffee elite 就像插畫裡的貓咪 溫暖、舒適、充滿人情味【Dew36 】以濾杯萃取 綻放為滴滴馥郁的咖啡精露 象徵對咖啡執著與分享~從天花板到地面的大menu 是店內的特色之一 抬頭就可以直接選擇 今天想品嘗的咖啡啦~【冰滴咖啡】 完全以冷水滴濾 萃取出  香濃、渾厚、滑順而不酸澀喝過之後  久久無法忘懷~', '12', '34', '2017-04-16', 'a10.jpg', 'b10.jpg', 't10.jpg');
