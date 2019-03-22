class LikesController < ApplicationController

  after_action :verify_authorized

def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     @topic = @bookmark.topic
     like = current_user.likes.build(bookmark: @bookmark)

     authorize like

     if like.save
       flash[:notice] = "Your like has been saved."
     redirect_to @bookmark
     else
       flash[:alert] = "ERROR. There's a problem saving your like, please try again."
       redirect_to @bookmark
     end
   end

   def destroy
     @bookmark = Bookmark.find(params[:bookmark_id])
     @topic = @bookmark.topic
     like = current_user.likes.find(params[:id])
     authorize like

     if like.destroy
       flash[:notice] = "Like destroyed."
       redirect_to @topic
     else
       flash[:notice] = "ERROR. Your like has not been destroyed."
       redirect_to @topic
     end
   end
 end
