class UsersController < ApplicationController
  before_filter :require_no_user, :only => [ :new, :create ]
  before_filter :require_user, :only => [ :show, :edit, :update ]
  before_filter :admin_required, :only => [ :index, :destroy ]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      add_notice "Account registered!"
      redirect_back_or_default root_url
    else
      render :new
    end
  end
  
  def show
    find_user
  end

  def edit
    find_user
  end
  
  def update
    find_user
    if @user.update_attributes(params[:user])
      add_notice "Account updated!"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    find_user
    @user.destroy
    add_notice 'User was deleted.'
    redirect_to(users_url)  
  end

private
  def find_user
    if @current_user.admin? && params[:id]
      @user = User.find(params[:id])
    else
      @user = @current_user
    end
  end
  
end
