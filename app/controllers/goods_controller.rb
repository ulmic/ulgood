class GoodsController < ApplicationController

  before_filter do
    redirect_to :root unless account_signed_in?
  end

  def index
    @goods =  params[:all] ? Good.all : Good.today
  end

  def check
    @good = Good.find params[:id]
    if admin_signed_in?
      @good.checked=true
      @good.save
    end
    redirect_to :back
  end

  def create
    @good = current_account.goods.new params[:good]
    if @good.save
      flash[:notice] = t :post_success
      redirect_to current_user
    else
      flash[:notice] = @good.errors.full_messages.each { |m| "<p class='flash'>#{m}</p>" }
      redirect_to :back
    end
  end

  def destroy
    @good = Good.find params[:id]
    if @good.user == current_user || admin_signed_in?
      if @good.destroy
        flash[:notice] = t :delete_success
        redirect_to :back
      else
        flash[:notice] = @good.errors.full_messages.each { |m| "<p class='flash'>#{m}</p>" }
        redirect_to :back
      end
    end
  end
end
