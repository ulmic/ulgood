# -*- encoding : utf-8 -*-
class UsersController < ApplicationController


  # GET /users/1
  # GET /users/1.json
  def show
    @head_style = "font-size: 30px;left: 20px;top: 0px;width: 50%;"
    @user = User.find(params[:id])
    @main_style = "top:60px;"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def delete

  end

end
