# -*- encoding : utf-8 -*-
module AdminHelper

  def new_posts
    posts = ""
    messages = Message.where :checked => 0


    if messages.count == 0
      posts = "Новых добрых дел нет!"
    else
      messages.each do |m|
        #TODO: Code repeat!
        posts += %{
					<div class = "today_list_item" #{'onclick = "show_full(this);" style="cursor:pointer;"' if m.message.length > 50 } onmouseover = "showSocialButtons(this);" onmouseout = "hideSocialButtons(this)">
						<a class = "user_name" href = 'users/#{m.social_user.user_id}'>
              #{m.social_user.user.name}
						</a>
						#{m.message}
            <span class = "">
              #{link_to "Принять", :controller => "admin", :action => "allow", :id => m.id if current_social_user.user.admin? }
              #{link_to "Удалить", :controller => "message", :action => "delete", :id => m.id if current_social_user.user.admin? }
            </span>
				}

        posts += %{
					</div>
				}
      end
    end
    posts
  end

end
