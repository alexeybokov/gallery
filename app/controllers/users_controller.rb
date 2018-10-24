class UsersController < ApplicationController

  respond_to :html, :js

  def follow
    @current_user.follow(@category)
    @follow = Follow.find_by(follower: @current_user, followable: @category)
    respond_to :js
  end

  def unfollow
    @current_user.stop_following(@category)
    respond_to :js
  end
end
