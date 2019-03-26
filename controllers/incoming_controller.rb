class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
     user = User.find(params[:sender])

     topic = Topic.find(params[:subject])

     url = params["body-plain"]

     if @user.nil?
       @user = User.new(email: user, password: "password")
       @user.save!
     end

      if @topic.nil?
        @topic = Topic.new(title: topic)
        @topic.save!
      end

      @bookmark = @topic.bookmarks.build(user: user, url: url)

      @bookmark.save!


    head 200
  end
end
