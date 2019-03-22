class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show
  @user = current_user
   @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes
    end
  end
