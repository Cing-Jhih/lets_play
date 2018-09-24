# Age

Age.destroy_all

age_list = [
  {old:0, name:"0歲"},
  {old:1, name:"1歲"},
  {old:2, name:"2歲"},
  {old:3, name:"3歲"},
  {old:4, name:"4歲"},
  {old:5, name:"5歲"},
  {old:6, name:"6歲"},
  {old:7, name:"7歲"},
  {old:8, name:"8歲"},
  {old:9, name:"9歲"},
  {old:10, name:"10歲"},
  {old:11, name:"11歲"},
  {old:12, name:"12歲"}
]

age_list.each do |age|
  Age.create(old: age[:old], name: age[:name])
end

puts "Age seed date created!"

# Situation
Situation.destroy_all

situation_list = [
  {condition: "無道具"},
  {condition: "餐廳"},
  {condition: "交通中"},
  {condition: "安靜"},
  {condition: "戶外"},
  {condition: "室內"},
]

situation_list.each do |situation|
  Situation.create(condition: situation[:condition])
end

puts "Situation seed data created!"

# Deafult admin and test user

User.create(email: "admin@test.com", password: "123456", role:"admin", name:"Admin")
User.create(email: "user@test.com", password:"123456", name:"User")

puts "Default admin and test user created!"
