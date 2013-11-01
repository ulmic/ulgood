class GoodsController < ApplicationController
  def index
    @goods =  params[:all] ? Good.all : Good.today
  end

  def create
    @good = current_account.goods.new params[:good]
    if @good.save
      flash[:notice] = t :post_success
      redirect_to current_user
    else
      flash[:notice] = @good.errors.full_messages.each { |m| "<p>#{m}</p>" }
      redirect_to :back
    end
  end

  def destroy
    @good = Good.find params[:id]
    if @good.user == current_user
      if @good.destroy
        flash[:notice] = t :delete_success
        redirect_to :back
      else
        flash[:notice] = @good.errors.full_messages.each { |m| "<p>#{m}</p>" }
        redirect_to :back
      end
    end
  end
end
