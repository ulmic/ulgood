# -*- encoding : utf-8 -*-
module AdminHelper

  def unchecked_posts
    posts = ""
    temp_date = 0
    messages = Message.where :checked => nil
    if messages.count == 0
      "Неподтверждённых постов нет"
    else
      messages.each do |m|
        if (m.created_at.day != temp_date)
          temp_date = m.created_at.day
          posts += %{
<div class = "date">
#{m.created_at.day}.#{m.created_at.month}
</div>
}
        end
        #TODO: Code repeat!
        posts += %{
					<div class = "today_list_item" #{'onclick = "show_full(this);" style="cursor:pointer;"' if m.message.length > 50 } onmouseover = "showSocialButtons(this);" onmouseout = "hideSocialButtons(this)">
          <div class = "admin_choose">
            #{link_to(image_tag("add.png"), "/admin/allow/#{m.id}")}
            #{link_to(image_tag("reject.gif"), "/admin/delete/#{m.id}") }
          </div>
					<div class="post_text">	<a class = "user_name" href = 'users/#{m.social_account.user_id}'>
              #{m.social_account.user.name}
						</a>
						  #{m.message}
          </div>
				}
        posts += %{
          <div style="clear: both;"></div>
				}
      end
    end
    posts
  end

end
