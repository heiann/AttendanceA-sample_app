class BasesController < ApplicationController
 before_action :set_user, only:[:show, :index, :new, :create, :edit, :update, :destroy]


  
  def index
    @user = User.find(params[:user_id])
    @bases = Base.all
  end
  
  def new
    @user = User.find(params[:user_id])
    @base = Base.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = "拠点登録完了しました。"
      redirect_to user_bases_path(@user)
    else
      flash[:alert] = "拠点登録に失敗しました。"
      render :new
    end
  end
  
  def show
     @user = User.find(params[:user_id])
     @base = Base.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:user_id])
    @base = Base.find(params[:id])
  end
  
  def update
    @base = Base.find(params[:base_id])
    if @base.update_attributes(base_params)
      flash[:success] = "拠点を更新しました。"
      redirect_to user_bases_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @base = Base.find(params[:base_id])
    @base.destroy
    flash[:success] = "拠点情報を削除しました。"
    redirect_to user_bases_path(@user)
  end
private  
  
  def set_user
      @user = User.find(params[:user_id])
  end
  def base_params
      params.require(:base).permit(:base_id, :base_name, :base_type)
  end
  
end
