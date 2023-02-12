class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
   
  end

  def show
    @user = User.find(params[:id])
    @albums = Album.where(user_id: @user.id)

    render :show
  end

  def new
    @user = User.new
  end

  def create
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
   
    @user = User.new(user_params)
    if @user.save
      render :index
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_show_url
    else
      render :edit
    end
  end
  

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:username,:email,:address,:phone,:website,:company_id,:pic_url,:address_id)
    end
  
end
