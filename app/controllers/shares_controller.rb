class SharesController < ApplicationController
  
  
  def index
      @shares = Share.all.page(params[:page]).per(15)
      @user = current_user
  end

  def show
      @share = Share.find(params[:id])
  end

  def new
      @share = current_user.shares.build
  end

  def create
      @share = current_user.shares.build(share_params)
      
      if @share.save
      flash[:success] = '正常に投稿されました'
      redirect_to @share
    else
      flash.now[:danger] = '投稿できませんでした'
      render :new
    end
  end

  def edit
      @share = current_user.shares.find(params[:id])
  end

  def update
      @share = current_user.shares.find(params[:id])
      
      if @share.save
        flash[:success] = '正常に編集されました'
        redirect_to @share
      else
        flash.now[:danger] = '編集できませんでした'
        render :new
      end
  end

  def destroy
    @share = current_user.shares.find(params[:id])
    @share.destroy

    flash[:success] = '正常に削除されました'
    redirect_to shares_url
  end
  
  def share_params
    params.require(:share).permit(:title, :content, :place, :name)
  end
  
end
