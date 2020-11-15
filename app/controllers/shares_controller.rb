class SharesController < ApplicationController
  def index
      @shares = Share.all.page(params[:page])
  end

  def show
      @share = Share.find(params[:id])
  end

  def new
      @share = Share.new
  end

  def create
      @share = Share.new(share_params)
      
      if @share.save
      flash[:success] = '正常に投稿されました'
      redirect_to @share
    else
      flash.now[:danger] = '投稿できませんでした'
      render :new
    end
  end

  def edit
      @share = Share.new(share_params)
      
      if @share.save
      flash[:success] = '正常に編集されました'
      redirect_to @share
    else
      flash.now[:danger] = '編集できませんでした'
      render :new
    end
  end

  def update
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy

    flash[:success] = '正常に削除されました'
    redirect_to shares_url
  end

  
  def share_params
    params.require(:share).permit(:title, :content, :place)
  end
  
  
end
