class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
   
  end


  

  private
    def set_article
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:username,:email,:address,:phone,:website,:company_id,:pic_url,:address_id)
    end
  
end
