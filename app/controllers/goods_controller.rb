class GoodsController < ApplicationController
  def index
    @goods =  params[:all] ? Good.all : Good.today
  end

  def create
    @good = current_account.goods.build params[:good]
    if @good.save!
      flash[:notice] = t :post_success
      redirect_to current_user
    else
      flash[:notice] = @good.errors.full_messages.each { |m| "<p>#{m}</p>" }
      redirect_to :back
    end
  end

  def destroy
  end
end
