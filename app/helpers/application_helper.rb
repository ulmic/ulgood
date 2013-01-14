# -*- encoding : utf-8 -*-
module ApplicationHelper

  def counters
    %{
    <div class="counters" style="display:inline-block;">
      <div style="text-align:center;">Добрых дел</div>
      <div class="simple_counter">
        Сегодня:
          <div class="counter_number">
    #{Message.where("created_at >= :time AND checked != 0", :time => Time.now.midnight).count}
          </div>
      </div>
    <div style="width:10px; display: inline-block;"></div>
    <div class="simple_counter">
    Всего:
    <div class="counter_number">
    #{link_to Message.where("checked != 0").count, :controller => "main", :action => "home", :messages => "all"}
    </div>
    </div>
        </div>
}
  end

end
