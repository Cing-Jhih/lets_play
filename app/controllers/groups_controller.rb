class GroupsController < ApplicationController
  GROUPS = {
    baby: {
      display: '嬰兒(0~2歲)',
      range: { min: 0, max: 3}
    },
    kindergarten: {
      display: '幼兒(3~5歲)',
      range: { min: 3, max: 6}
    },
    junior: {
      display: '低年級(6~7歲)',
      range: { min: 6, max: 8}
    },
    middle: {
      display: '中年級(8~9歲)',
      range: { min: 8, max: 10}
    },
    senior: {
      display: '高年級(10~12歲)',
      range: { min: 10, max: 13}
    },
  }

  def index
    redirect_to groups_path(which_group(kid_age: current_user.kid_age))
  end

  def show_users
    @groups = GROUPS
    @group_attr = GROUPS.select {|key, value| params[:level].include?(key.to_s) }
    @group_users =
      User.all.select { |user|
        age = user.kid_age
        age == nil ? false : (age.to_i >= @group_attr.values.first[:range][:min] && age.to_i < @group_attr.values.first[:range][:max])
      }
  end

  private

  def which_group (kid_age:)
    return "baby" unless kid_age
    kid_age = kid_age.to_i
    GROUPS.each { |key, value|
      return key if kid_age >= value[:range][:min] && kid_age < value[:range][:max]
    }
  end
end
