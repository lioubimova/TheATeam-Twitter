class FollowsController < ApplicationController

  def new
    @follow = current_user.follows.new(params[:follower_id])
  end

  def create
    @follow = current_user.follows.new(params[:follower_id])
    respond_to do |format|
    if @follow.save
      format.html {redirect_to_root_path,flash[:notice] = "Followed"}
      format.json { render json: @follow, status: :created, location: @follower }
      format.js {}
    else
      format.html { render action: "new",flash[:notice] = "Follow unsuccessful", }
      format.json { render json: @follow.errors,status: :unprocessable_entity}

    end
  end
end
def destroy
    @user = User.find(params[:id])
    @current_user.stop_following(@user)
    flash[:notice] = "Unfollowed!"
    redirect_to root_path
  end
end

def create
  @user = User.new(params[:user])

  respond_to do |format|
    if @user.save
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.js   {}
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render action: "new" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end
