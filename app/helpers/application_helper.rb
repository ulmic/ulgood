# -*- encoding : utf-8 -*-
require "social_users/omniauth_callbacks_helper"

module ApplicationHelper

  def counters
    if social_user_signed_in?
      %{
    <div class="counters" style="display:inline-block;">
      <div class="simple_counter">
        Добрых дел за сегодня:
          <div class="counter_number">
    #{Message.where(:created_at => Time.now.midnight+(60*60*4)..Time.now).count}
          </div>
      </div>
    <div style="width:10px; display: inline-block;"></div>
    <div class="simple_counter">
    Добрых дел за время работы:
    <div class="counter_number">
    #{link_to Message.all.count, :controller => "main", :action => "home", :messages => "all"}
    </div>
    </div>
        </div>
}
    end
  end

end
