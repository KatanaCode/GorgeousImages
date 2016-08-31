class HomepageController < ApplicationController
  def show
    @user_photo = UserPhoto.last
  end
end
