class Todo < ActiveRecord::Base

  def user
    @user = User.find_by_id(@user.id)
    return @user
  end
end