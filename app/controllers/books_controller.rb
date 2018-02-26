class BooksController < ApplicationController

    before_action :authenticate_user!

  def index#空のモデルを渡す
  	@book = Book.new
  	#記事そ全件取得
  	@books = Book.all
  end

  def show#投稿されたデータをBookのDBからfindで探してくる
  	@book = Book.find(params[:id])
    # @user = User.find(params[:id])
  end

  def create
    # ストロングパラメーターを使用
     post = Book.new(post_params)
     post.user_id = current_user.id
    # DBへ保存する
     post.save
    # 新規投稿画面へリダイレクト
    # redirect_to '/books'
    redirect_to book_path(post)#今保存した先に飛ぶ
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	#投稿されたデータをBookのDBからfindで探してくる
  	book = Book.find(params[:id])
  	book.update(post_params)
  	# 削除したらindexへリダイレクト
  	redirect_to books_path
  end

  def destroy
  	#投稿されたデータをBookのDBからfindで探してくる
  	book = Book.find(params[:id])
  	book.destroy
  	# 削除したらindexへリダイレクト
  	redirect_to books_path
  end

  private

  def post_params #テーブル名とカラム
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
