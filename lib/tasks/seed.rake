namespace :seed do
  task games: :environment do
    Game.create!(
     user_id:3,
     title:"一起來說說", remote_image_url:"https://cw1.tw/CP/images/article/P1398133247012.png",
     url:"",
     tool:"",
     step:"
1. 在嬰兒出現牙牙學語時，成人可適時加入寶寶咿啞咿啞的行列，模仿寶寶發出的聲音；並觀察當成人說話後，寶寶是否會接續著發出聲音，類似輪流對話的方式。

2. 在嬰兒發出近似「爸」、「媽」、「哥」、「包」等單音時，大人也可擴充孩子的詞語，說出疊字或簡單詞彙，如「爸爸」、「媽媽」、「哥哥」、「麵包」等，讓寶寶進一步#模仿，並學習正確的聲音與嘴型。

3. 大人也可唸一些簡單的#手指謠，如〈大姆哥〉或〈三輪車〉，在念謠中讓寶寶體會語言的聲韻趣味。",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 1 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "無道具").id
   )

Game.create!(
     user_id:4,
     title:"毛巾運球", remote_image_url:"",
     url:"https://youtu.be/lvpQUWwfHxk",
     tool:"大浴巾，小球",
     step:"大人與小孩合力拉直大毛巾，將毛巾上放置小球，#合做 運送到終點。",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 3.0 ).id
   )
AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 2.0 ).id
   )

   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )
SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "戶外").id
   )

Game.create!(
     user_id:2,
     title:"九宮格空間概念訓練", remote_image_url:"",
     url:"https://youtu.be/YXnEf_G5E24",
     tool:"透明文件夾, 白紙，彩色點點貼，奇異筆",
     step:"
1.白紙折成6等分，畫上六個九宮格，在左邊三個九宮格中，任意貼上各色點點貼。
2.貼好一半的遊戲紙放入套明文件夾。
3.開始玩囉~請小朋友把點點貼貼到右邊三個九宮格中，要一模一樣喔!
#空間配對 #眼力 #細心 #專注力
",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 5.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "安靜").id
   )
SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "交通中").id
   )
SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )


Game.create!(
     user_id:5,
     title:"中秋親子遊戲~棒打柚子帽",
remote_image_url:"",
     url:"https://youtu.be/Rnd2GwxUBRM",
     tool:"柚子帽，紙捲棒",
     step:"
剪刀石頭布，輸家拿柚子帽戴上，贏家拿紙捲棒打輸家的頭，看誰#反應快!
將#英文 融入遊戲，配合#節慶 更有FU喔!保證玩到驚聲尖笑!
",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 5.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )
AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 6.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )


Game.create!(
     user_id:7,
     title:"沙水好朋友",
remote_image_url:"",
     url:"",
     tool:"沙子，水桶，玩沙工具",
     step:"
1. 除了洗澡外，可安排其他玩水的機會。如穿上防水圍兜洗玩具，在臉盆中洗小石頭，或是請他幫忙洗摔不壞的餐具等。

2. 寶寶似乎特別容易受到玩沙活動的吸引。可準備一些玩沙的小器具，如不同大小的容器、湯匙、鏟子、小樹枝、小石頭等，都是很好的玩沙道具。

3. 沙加上水，更可以帶給孩子豐富的#感官體驗。遊戲中可讓孩子體會乾與溼、輕與重、溫度變化等不同概念，也可帶著寶寶練習堆疊、捏塑不同形狀，讓手指#精細動作 有更多練習機會。

小提醒

1.雖然沙水遊戲容易造成髒亂，但也幫助幼兒在遊戲中學習。大人在旁可注意孩子玩水的安全性，並在遊戲告一段落時，與孩子一起進行清潔工作。

2. 平日可準備一、兩套不怕髒的沙水遊戲專用衣物與鞋子，大人就不必在遊戲過程中不斷掃興的提醒清潔問題。
",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 1.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 2.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "戶外").id
   )

Game.create!(
     user_id:1,
     title:"拿（夾、捏）你千遍，也不厭倦",
remote_image_url:"",
     url:"",
     tool:"裝有玩具的箱子，一盤葡萄乾",
     step:"1～2歲這個時期，孩子開始能協調的使用手指，並培養「以大拇指與食指撿拾東西」的能力，手指與手腕的動作也更為成熟。透過將玩具重複放入、拿出的示範過程，可讓孩子開始體會「看不見的東西，並不代表沒有」的物體恆存概念。
1. 準備一個空箱子與一些寶寶方便抓取的玩具。大人先示範把玩具放進箱子中，然後問寶寶：「玩具呢？」之後在他的注視下，把箱中的玩具拿出來，讓寶寶模仿你「放進去、拿出來」的動作。
2. 隨著寶寶抓握力日漸成熟，大人可準備一盤葡萄乾，玩「撿拾葡萄乾」的遊戲。寶寶在練習過程中，也能用拇指與食指抓取葡萄乾當點心。

小提醒

注意玩具物件的安全性。若是小珠子、玩具零件等，則不適合用來訓練寶寶的精細動作
#認知 #粗動作 #抓
",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 1.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )

Game.create!(
     user_id:1,
     title:"開動物派對，一起吃飯囉！",
remote_image_url:"",
     url:"",
     tool:"湯匙，不鏽鋼碗",
     step:"1. 準備適合幼兒高度的桌椅，告訴他：「今天要跟小動物一起開派對。」

2. 家長先示範如何握著湯匙，將義大利麵舀到其他碗裡；再把湯匙交給寶寶，讓他用湯匙幫其他動物舀義大利麵，一起開派對。

3. 若幼兒一開始無法達成目標，大人可以先握住他的慣用手協助。
",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 3.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "交通中").id
   )
Game.create!(
     user_id:14,
     title:"0-6個月大親子互動遊戲", remote_image_url:"",
     url:"https://youtu.be/k0jjTwU_Sh8",
     tool:"視覺閃卡，棉花，毛巾",
     step:"雖然未滿6個月大的寶寶多在吃吃睡睡，但是我們還是可藉由與寶寶說話，#刺激聽覺 發展，握握寶寶的手，讓寶寶主動去抓握你的手。
等寶寶4~5個月大，可以拿棉花、毛巾等不同觸感的物品給寶寶抓握進行#觸覺體驗，初生嬰兒一開始只能看到黑白，之後漸漸能看到彩色，寶寶會驚奇的發現這個世界是如此多采多姿，父母可以拿色彩鮮艷的卡片，在寶寶眼前8-10吋的位置，慢慢左右移動，給寶寶#視覺刺激",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 0 ).id
   )


   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )

Game.create!(
     user_id:21,
     title:"DIY拼圖積木，提升腦力",
remote_image_url:"",
     url:"https://youtu.be/_2nRiK9kdYc",
     tool:"小紙盒，巧拼",
     step:"將家中各種小紙盒、飾品包裝盒等，(亦可#DIY，貼上漂亮色紙)當作積木讓寶寶玩，透過堆疊，可以刺激#肌肉發展、#手眼協調，學習上下左右等相對位置概念。
印出簡單的彩色圖片，黏貼在巧拼之後切開，就是#DIY大拼圖",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 1 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 2 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )

Game.create!(
     user_id:11,
     title:"菇仔學習有計–玩遊戲學專心", remote_image_url:"",
     url:"",
     tool:"羽毛",
     step:"小朋友的專注力會影響學習能力，而不同年紀的小朋友的專注時間亦有所差異。想提升小朋友的專注力？菇仔示範了一些好玩的小遊戲，適合父母與小朋友一起玩，例如：「吹羽毛」可以訓練#視覺追蹤、「找不同」、「媽媽話」及輪流講故事可以刺激#聽覺專注力，可以加強小朋友的#專注力，更有助提升親子關係，大家不妨試試。",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 3.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )
AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "餐廳").id
   )
   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )

Game.create!(
     user_id:9,
     title:"在車上消耗小孩電力的親子遊戲",
remote_image_url:"",
     url:"https://youtu.be/g7nkhIQ8ceA",
     tool:"枕頭、抱枕",
     step:"在#車上 玩這個，冬天都不會冷，非常的#熱血！

遊戲規則就是
「誰先把手上的枕頭、抱枕全丟到對方手裡就是贏家！」",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 3.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )

   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "交通中").id
   )

Game.create!(
     user_id:1,
     title:"兒童遊戲-抓雪花", remote_image_url:"",
     url:"",
     tool:"小紙片",
     step:"把數字寫在小紙片上跟孩子玩抓雪花的遊戲囉！孩子要抓住落下的雪花需要具備良好的#手眼協調 能力，抓到的雪花可以拿來比大小、排數字順序、甚至是加減乘除等高難度的運算，原來數學也可以這麼好玩喔！
#diy, #數學, #動態視覺
",
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 3.0 ).id
   )
   AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 4.0 ).id
   )
AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 5.0 ).id
   )
AgeGame.create!(
     game_id: Game.last.id,
     age_id: Age.find_by(old: 6.0 ).id
   )
   SituationGame.create!(
     game_id: Game.last.id,
     situation_id: Situation.find_by(condition: "室內").id
   )


   puts "seed game created"
 
 end
end
