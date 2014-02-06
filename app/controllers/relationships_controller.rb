class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    #redirect method
    # redirect_to @user
    #ajax request
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end 
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    #redirect method
    # redirect_to @user
    #ajax request
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
    end
  end
end