class UsersController < ApplicationController

before_action :authenticate_user!

	def index
	  @users = User.all
	end

#ユーザの詳細画面
  def show
#ユーザ１件の情報を取得
  	@user = User.find(params[:id])
  end

#params[:id]からユーザ情報を取得して@userインスタンスにしまう。
  def edit
  	@user = User.find(params[:id])
  end

  def update
#ユーザ１件の情報を取得
    @user = User.find(params[:id])

    @user.update(user_params)
#更新した後のリダイレクト先
    redirect_to user_path(@user.id)
  end

private

#フォームで受け取ったデータをpost_paramsで中身が大丈夫か確認しながら違う箱に詰め直す
def user_params
    params.require(:user).permit(:name, :profile_image, :password)
end

end
