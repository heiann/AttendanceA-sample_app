class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info, :edit_overwork_approval, :update_overwork_approval]
  before_action :logged_in_user, only: [:index, :show, :update, :destroy, :edit_basic_info, :update_basic_info, :edit_overwork_approval, :update_overwork_approval]
  before_action :correct_user, only: [:edit, :update]
  before_action :set_one_month, only: :show
  before_action :admin_user, only: [:destroy, :edit_basic_info, :update_basic_info, :edit_overwork_approval, :update_overwork_approval]
  

  def index
    @users = User.all
    if params[:name].present?
      @users = @users.get_by_name params[:name] 
    end
  end
  
  def index_attendance
    @users = User.all.includes(:attendances)
  end
  
  def import
    # fileはtmpに自動で一時保存される
    User.import(params[:file])
    redirect_to users_path
  end

  def show
    @worked_sum = @attendances.where.not(started_at: nil).count
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit      
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end
  
  def edit_overwork_approval
  end
  
  def update_overwork_approval
  end
  
  def update_basic_info
  
    if User.update(basic_info_params)
      flash[:success] = "基本情報を更新しました。"
      redirect_to  users_url
      
    else
      flash[:danger] = "更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
      redirect_to edit_basic_info_user_url
    end
  end  
  # paramsハッシュからユーザーを取得します。
    
  def set_user
      @user = User.find(params[:id])
  end

    # ログイン済みのユーザーか確認します。
  def logged_in_user
    unless logged_in?
        store_location
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
    end
  end

    # アクセスしたユーザーが現在ログインしているユーザーか確認します。
  def correct_user
      redirect_to(root_url) unless current_user?(@user)
  end

    # システム管理権限所有かどうか判定します。
  def admin_user
      redirect_to root_url unless current_user.admin?
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :employee_number, :uid, :basic_time, :work_start_time, :work_end_time, :superior, :admin, :password)
    end
 
  def basic_info_params
      params.require(:user).permit(:basic_time, :work_start_time, :work_end_time)
  end

  def basic1_info_params
      params.require(:user).permit(:basic_time, :work_start_time, :work_end_time)
  end
end
