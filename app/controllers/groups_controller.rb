class GroupsController < ApplicationController
  def index
    @user_baby = User.all.select { |user| age = user.kid_age.to_i; age >= 0 && age < 3 }
    @user_kidergarten = User.all.select { |user| age = user.kid_age.to_i; age >= 3 && age < 6 }
    @user_junior = User.all.select { |user| age = user.kid_age.to_i; age >= 6 && age < 8 }
    @user_middle = User.all.select { |user| age = user.kid_age.to_i; age >= 8 && age < 10 }
    @user_senior = User.all.select { |user| age = user.kid_age.to_i; age >= 10 && age < 13 }
  end
end
