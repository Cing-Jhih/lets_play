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
        remote_avatar_url: data["photo"], 
        kid_birth: FFaker::Time::between(12.years.ago, 2.days.ago)
      ) 
      user.save!
      puts user.email
    end  
    puts "Now you have #{User.count} fake users"
  end

  task fake_games: :environment do
    Game.destroy_all
    AgeGame.destroy_all
    SituationGame.destroy_all

    100.times do |i|
      tools = []
      8.times do |t|
        tool = FFaker::Product::product_name + ","
        tools << tool
      end
        
      Game.create!(
        title: FFaker::Lorem::phrase,
        tool:  tools.first(rand(0..8)).join,
        step: FFaker::Lorem::sentence(113),
        remote_image_url: FFaker::Image::url,
        url: 'http://'+FFaker::Youtube::share_url,
        user_id: User.all.sample.id
        )
      AgeGame.create!(
        age_id: Age.all.sample.id,
        game_id: Game.last.id,
        )
      SituationGame.create!(
        situation_id: Situation.all.sample.id,
        game_id: Game.last.id,
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

  task fake_followships: :environment do
    Followship.destroy_all
    puts "creating fake followship..." 
    User.all.each do |u|
      @users = User.where.not(id: u.id).shuffle
      6.times do
        u.followships.create!(
        following: @users.pop,
        )
      end
    end
    puts "now you have #{Followship.count} followship"
  end

  task fake_messages: :environment do
    Message.destroy_all
    User.all.each do |u|
      @users = User.where.not(id: u.id).shuffle
      3.times do
        u.messages.create!(
        receiver: @users.pop,
        content: FFaker::Lorem::sentence(13)
        )
      end
    end
    puts "Now you have #{Message.count} fake replies"
  end

  task rebuild: [
    "db:drop",
    "db:create",
    "db:migrate",
    "db:seed",
    :fake_users,
    "seed:games",
    :fake_favorites,
    :fake_replies,
    :fake_followships,
    :fake_messages
    ]
    
  task fake_all: [
    :fake_users,
    "seed:games",
    :fake_favorites,
    :fake_replies,
    :fake_followships,
    :fake_messages
    ]

end
