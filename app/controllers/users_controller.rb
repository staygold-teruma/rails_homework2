class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # ●User.all部分について
  # N＋1問題に対応する為、1対多になる場合はモデル.include(:紐づいているもの)を使う方が良さそう
  # (例) @tasks = Task.include(:user)

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # redirect_to action: :index
    # redirect_to users_path, notice: "#{@user.name}を登録しました"
    # redirect_toはaction指定でもパス指定でもOK
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    # redirect_to users_path, notice: "#{user.name}を更新しました"
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    # redirect_to users_path, notice: "#{user.name}を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end
end
