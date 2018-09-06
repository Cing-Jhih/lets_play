namespace :dev  do
  task fake_users: :environment do
    user = User.all
    user.each do |user|
      if user.role != "admin" && user.name != "User"
        user.destroy
      end
    end

    url = "https://uinames.com/api/?ext&region=england"
    
    20.times do
      response = RestClient.get(url)
      data = JSON.parse(response.body)

      user= User.create!(
        email: data["email"],
        password: "123456",
        name: data["name"],
        intro: FFaker::Lorem.paragraph,
        avatar: data["photo"], # modify after CarrierWave installed
        kid_birth: FFaker::Time::between(12.years.ago, 2.days.ago)
      ) 
      user.save!
      puts user.email
    end  
    puts "Now you have #{User.count} fake users"
  end

  task fake_games: :environment do
    Game.destroy_all
    100.times do |i|
      Game.create!(
        title: FFaker::Lorem::phrase,
        tool: FFaker::Product::product_name, # 讓tool數量可從0~8
        step: FFaker::Lorem::sentence(113),
        image:"https://via.placeholder.com/800*600", # modify after CarrierWave installed
        user_id: User.all.sample.id           
        )
    end
    puts "Now you have #{Game.count} fake games"
  end

    task fake_favorites: :environment do
    Favorite.destroy_all
    50.times do |i|
        Favorite.create!(
          user_id: User.all.shuffle.pop.id,
          game_id: Game.all.shuffle.pop.id,
          )
      end
    puts "Now you have #{Favorite.count} fake favorites"
  end

    task fake_replies: :environment do
    Reply.destroy_all
    100.times do |i|
        Reply.create!(
          user_id: User.all.shuffle.pop.id,
          game_id: Game.all.shuffle.pop.id,
          content: FFaker::Lorem::sentence(13)
          )
      end
    puts "Now you have #{Reply.count} fake replies"
  end

  task rebuild: [
    "db:drop",
    "db:create",
    "db:migrate",
    "db:seed",
    :fake_users,
    :fake_games,
    :fake_favorites,
    :fake_replies
    ]

  task rebuild_heroku: [
    "db:migrate",
    :fake_users,
    :fake_games,
    :fake_favorites,
    :fake_replies
    ]
    
  task fake_all: [
    :fake_users,
    :fake_games,
    :fake_favorites,
    :fake_replies
    ]  

end
