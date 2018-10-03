namespace :seed do
 task games: :environment do
  Game.destroy_all
  AgeGame.destroy_all
  SituationGame.destroy_all

      Game.create!(
      user_id: User.all.sample.id,
      title:"一起來說說", remote_image_url:"https://cw1.tw/CP/images/article/P1398133247012.png",
      url:"",
      tool:"",
      min_age:0,
      max_age:1,
      step:"1. 在嬰兒出現牙牙學語時，成人可適時加入寶寶咿啞咿啞的行列，模仿寶寶發出的聲音；並觀察當成人說話後，寶寶是否會接續著發出聲音，類似輪流對話的方式。
            2. 在嬰兒發出近似「爸」、「媽」、「哥」、「包」等單音時，大人也可擴充孩子的詞語，說出疊字或簡單詞彙，如「爸爸」、「媽媽」、「哥哥」、「麵包」等，
            讓寶寶進一步#模仿，並學習正確的聲音與嘴型。
            3. 大人也可唸一些簡單的#手指謠，如〈大姆哥〉或〈三輪車〉，在念謠中讓寶寶體會語言的聲韻趣味。"
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "無道具").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"毛巾運球", remote_image_url:"",
      url:"https://youtu.be/lvpQUWwfHxk",
      tool:"大浴巾，小球",
      min_age:2,
      max_age:4,
      step:"大人與小孩合力拉直大毛巾，將毛巾上放置小球，#合做 運送到終點。"
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
      user_id:User.all.sample.id,
      title:"九宮格空間概念訓練", remote_image_url:"",
      url:"https://youtu.be/YXnEf_G5E24",
      tool:"透明文件夾, 白紙，彩色點點貼，奇異筆",
      min_age:4,
      max_age:6,
      step:"1.白紙折成6等分，畫上六個九宮格，在左邊三個九宮格中，任意貼上各色點點貼。
            2.貼好一半的遊戲紙放入套明文件夾。
            3.開始玩囉~請小朋友把點點貼貼到右邊三個九宮格中，要一模一樣喔!
            #空間配對 #眼力 #細心 #專注力
            "
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
      user_id: User.all.sample.id,
      title:"中秋親子遊戲~棒打柚子帽",
      remote_image_url:"",
      url:"https://youtu.be/Rnd2GwxUBRM",
      tool:"柚子帽，紙捲棒",
      min_age:4,
      max_age:6,
      step:"剪刀石頭布，輸家拿柚子帽戴上，贏家拿紙捲棒打輸家的頭，看誰#反應快!
            將#英文 融入遊戲，配合#節慶 更有FU喔!保證玩到驚聲尖笑!
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"沙水好朋友",
      remote_image_url:"",
      url:"",
      tool:"沙子，水桶，玩沙工具",
      min_age:1,
      max_age:2,
      step:"1. 除了洗澡外，可安排其他玩水的機會。如穿上防水圍兜洗玩具，在臉盆中洗小石頭，或是請他幫忙洗摔不壞的餐具等。
            2. 寶寶似乎特別容易受到玩沙活動的吸引。可準備一些玩沙的小器具，如不同大小的容器、湯匙、鏟子、小樹枝、小石頭等，都是很好的玩沙道具。
            3. 沙加上水，更可以帶給孩子豐富的#感官體驗。遊戲中可讓孩子體會乾與溼、輕與重、溫度變化等不同概念，也可帶著寶寶練習堆疊、捏塑不同形狀，讓手指#精細動作 有更多練習機會。
            小提醒
            1.雖然沙水遊戲容易造成髒亂，但也幫助幼兒在遊戲中學習。大人在旁可注意孩子玩水的安全性，並在遊戲告一段落時，與孩子一起進行清潔工作。
            2. 平日可準備一、兩套不怕髒的沙水遊戲專用衣物與鞋子，大人就不必在遊戲過程中不斷掃興的提醒清潔問題。
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "戶外").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"拿（夾、捏）你千遍，也不厭倦",
      remote_image_url:"",
      url:"",
      tool:"裝有玩具的箱子，一盤葡萄乾",
      min_age:1,
      max_age:1,
      step:"1～2歲這個時期，孩子開始能協調的使用手指，並培養「以大拇指與食指撿拾東西」的能力，手指與手腕的動作也更為成熟。透過將玩具重複放入、拿出的示範過程，可讓孩子開始體會「看不見的東西，並不代表沒有」的物體恆存概念。
            1. 準備一個空箱子與一些寶寶方便抓取的玩具。大人先示範把玩具放進箱子中，然後問寶寶：「玩具呢？」之後在他的注視下，把箱中的玩具拿出來，讓寶寶模仿你「放進去、拿出來」的動作。
            2. 隨著寶寶抓握力日漸成熟，大人可準備一盤葡萄乾，玩「撿拾葡萄乾」的遊戲。寶寶在練習過程中，也能用拇指與食指抓取葡萄乾當點心。
            小提醒
            注意玩具物件的安全性。若是小珠子、玩具零件等，則不適合用來訓練寶寶的精細動作
            #認知 #粗動作 #抓
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"開動物派對，一起吃飯囉！",
      remote_image_url:"",
      url:"",
      tool:"湯匙，不鏽鋼碗",
      min_age:3,
      max_age:4,
      step:"1. 準備適合幼兒高度的桌椅，告訴他：「今天要跟小動物一起開派對。」
            2. 家長先示範如何握著湯匙，將義大利麵舀到其他碗裡；再把湯匙交給寶寶，讓他用湯匙幫其他動物舀義大利麵，一起開派對。
            3. 若幼兒一開始無法達成目標，大人可以先握住他的慣用手協助。
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "交通中").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"0-6個月大親子互動遊戲", remote_image_url:"",
      url:"https://youtu.be/k0jjTwU_Sh8",
      tool:"視覺閃卡，棉花，毛巾",
      min_age:0,
      max_age:0,
      step:"雖然未滿6個月大的寶寶多在吃吃睡睡，但是我們還是可藉由與寶寶說話，#刺激聽覺 發展，握握寶寶的手，讓寶寶主動去抓握你的手。
            等寶寶4~5個月大，可以拿棉花、毛巾等不同觸感的物品給寶寶抓握進行#觸覺體驗，初生嬰兒一開始只能看到黑白，之後漸漸能看到彩色，
            寶寶會驚奇的發現這個世界是如此多采多姿，父母可以拿色彩鮮艷的卡片，在寶寶眼前8-10吋的位置，慢慢左右移動，給寶寶#視覺刺激"
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"DIY拼圖積木，提升腦力",
      remote_image_url:"",
      url:"https://youtu.be/_2nRiK9kdYc",
      tool:"小紙盒，巧拼",
      min_age:1,
      max_age:2,
      step:"將家中各種小紙盒、飾品包裝盒等，(亦可#DIY，貼上漂亮色紙)當作積木讓寶寶玩，透過堆疊，可以刺激#肌肉發展、#手眼協調，學習上下左右等相對位置概念。
            印出簡單的彩色圖片，黏貼在巧拼之後切開，就是#DIY大拼圖"
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"菇仔學習有計–玩遊戲學專心", remote_image_url:"",
      url:"",
      tool:"羽毛",
      min_age:3,
      max_age:5,
      step:"小朋友的專注力會影響學習能力，而不同年紀的小朋友的專注時間亦有所差異。想提升小朋友的專注力？
      菇仔示範了一些好玩的小遊戲，適合父母與小朋友一起玩，例如：「吹羽毛」可以訓練#視覺追蹤、「找不同」、
      「媽媽話」及輪流講故事可以刺激#聽覺專注力，可以加強小朋友的#專注力，更有助提升親子關係，大家不妨試試。"
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
      user_id: User.all.sample.id,
      title:"在車上消耗小孩電力的親子遊戲",
      remote_image_url:"",
      url:"https://youtu.be/g7nkhIQ8ceA",
      tool:"枕頭、抱枕",
      min_age:3,
      max_age:4,
      step:"在#車上 玩這個，冬天都不會冷，非常的#熱血！
            遊戲規則就是
            「誰先把手上的枕頭、抱枕全丟到對方手裡就是贏家！」"
      )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "交通中").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"兒童遊戲-抓雪花", remote_image_url:"",
      url:"",
      tool:"小紙片",
      min_age:3,
      max_age:6,
      step:"把數字寫在小紙片上跟孩子玩抓雪花的遊戲囉！孩子要抓住落下的雪花需要具備良好的#手眼協調 
      能力，抓到的雪花可以拿來比大小、排數字順序、甚至是加減乘除等高難度的運算，原來數學也可以這麼好玩喔！
            #diy, #數學, #動態視覺
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"身體變魔術", remote_image_url:"",
      url:"",
      tool:"無",
      min_age:1,
      max_age:2,
      step:"大人的身體是極佳的遊戲工具，「身體變魔術」就是個不需任何物品或玩具輔助，就能逗得孩子哈哈笑的身體遊戲。大人可以把自己想像成驚奇箱中的彈跳小丑，用幽默逗趣的方式，把身體部位與各種聲音結合在一起。
            1.把寶寶抱在身前，與他面對面。
            2.透過五官與聲音的配對組合，吸引寶寶注意。如拉臉頰時發出「ㄅㄚˇㄅㄨ」聲、捏鼻子時發出扣扣聲、拉左耳時吐舌頭、拉右耳時抬起左手。
            3.一開始可以自己先演給寶寶看。等孩子慢慢領略聲音與動作之間的關聯性後，讓寶寶碰你的五官，你來發出各種不同聲音。
            #認知, #社會, #身體動作
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "無道具").id
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "戶外").id
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "餐廳").id
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "交通中").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"童話小劇場", remote_image_url:"",
      url:"",
      min_age:3,
      max_age:5,
      tool:"毯子或床單；寶寶最喜歡最熟悉的童話故事書,所選角色需要的戲服、佈景或面具",
      step:"1.這將需要一個比較長的準備過程，你可以讓孩子一起參與製作戲服，並讓孩子瞭解自己扮演角色所要說的臺詞,
            2.在房間中間攤開毯子，作為舞臺，並佈置好佈景,
            3.為你自己和孩子穿上戲服,
            4.一起演出這個故事,
            5.你們還可以在親朋好友和孩子的小朋友面前表演這齣戲，它可以成為你們家的保留節目哦！
            注意事項：孩子有時會說出和劇情不符的臺詞，要鼓勵並配合他突發的奇想哦！
            #戲劇, #身體動作
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"找寶藏", remote_image_url:"",
      url:"",
      min_age:4,
      max_age:6,
      tool:"為孩子準備一件神秘禮物，如他喜歡吃的糖果或喜愛的玩具，作為寶貝,一些卡片（可以是空白的名片卡）,一個裝卡片的小包包。",
      step:"1.先把神秘寶貝藏起來,
            2.製作卡片，可以文字配合圖片，如畫一張衣櫃，再寫上「衣櫃」及其拼音。再分別把卡片藏好,
            3.替孩子背上小包包，然後給他第一張「衣櫃」卡片，小朋友就可以到衣櫃那邊找另一張指示卡片了,
            4.依此類推直到孩子找到寶藏。
            注意事項：把卡片和寶貝藏在孩子容易找到的地方，同時要確定房間裏沒有讓孩子碰撞或受傷的地方。
            #數學邏輯, #身體動作
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"買東西嘍！", remote_image_url:"",
      url:"",
      min_age:6,
      max_age:8,
      tool:"假的錢（可以是錢幣樣式的，也可以是自己做的紙錢）,賣的東西的標價單（自製）；小玩具",
      step:"1.先簡單介紹一下錢的面值,
            2.媽媽和孩子一個扮演老闆，一個扮演顧客,
            3.老闆在要「賣」的小玩具前放上標價單,
            4.顧客來買東西，「交易」開始了。
            注意事項：孩子年紀還小，所以，「交易」最好在10元以內。
            #數學邏輯, #角色扮演, #社會化
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"自己做樂器", remote_image_url:"",
      url:"",
      min_age:6,
      max_age:10,
      tool:"各種罐子,小豆子,小石子,7個矮玻璃杯,鍋蓋,小鈴鐺,鬆緊帶等",
      step:"1.在空罐中加入小豆子,
            2.在另一個罐子中加入小石子，讓孩子比較一下，兩個罐子發出的聲音有什?不同,
            3.在7 個矮玻璃杯中加入水，比例是1：2：3：4：5：6：7，用不銹鋼湯匙敲就會有不同的音調傳出,
            4.2個鍋蓋可以當成銅鑼,
            5.鬆緊帶系上小鈴鐺，套在孩子的手上就是手鐲鈴了。
            6.好了，現在可以舉辦一個小小的家庭音樂會了。
            注意事項：一定要注意安全，確保罐子的開口不尖利，以免傷到孩子。
            #DIY, #音樂, #律動, #身體知覺
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "室內").id
            )

      Game.create!(
      user_id: User.all.sample.id,
      title:"扔沙包", remote_image_url:"",
      url:"",
      min_age:6,
      max_age:12,
      tool:"一塊小布片；一小堆細沙",
      step:"1.把布片三面縫合，裝入細沙，再把最後一面縫合，做成一個沙包,
            2.爸爸媽媽面對面約隔4-5米，孩子站在當中,
            3.爸爸媽媽負責扔沙包，孩子閃躲，若被扔中了就換人,
            4.或者和孩子站成一排，每人用腳夾住一個沙包，向前甩出去，接著跑去，用腳抓起自己的沙包再向前甩出去,
            5.誰先到達終點，誰就獲得了勝利。
            注意事項：爸爸媽媽扔沙包的時候請注意出手輕一些，孩子用腳甩沙包的時候，也當心他被絆倒。
            #運動, #親子同樂
            "
            )
      SituationGame.create!(
            game_id: Game.last.id,
            situation_id: Situation.find_by(condition: "戶外").id
            )

      puts "seed data created!"

  end
end
