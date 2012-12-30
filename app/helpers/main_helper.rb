# -*- encoding : utf-8 -*-
module MainHelper

  def posts (messages_class)
    posts = ""

    if messages_class == "all"
      messages = Message.where "checked!=0"
    else
      messages = Message.where :created_at => Time.now.midnight..Time.now+60*60*4
      messages = messages.where ("checked!=0")
    end

    if messages.count == 0
      if messages_class != "all"
        posts = "Стань сегодня первым!"
      else
        posts = "Добрых дел ещё нет. Расскажи о своём!"
      end
    else
      messages.each do |m|
        #TODO: Code repeat!
        posts += %{
					<div class = "today_list_item" #{'onclick = "show_full(this);" style="cursor:pointer;"' if m.message.length > 50 } onmouseover = "showSocialButtons(this);" onmouseout = "hideSocialButtons(this)">
						<a class = "user_name" href = 'users/#{m.social_user.user_id}'>
              #{m.social_user.user.name}
						</a>
						  #{m.message}
						<span class = "social_post">
              #{link_to image_tag("vkontakte-small-icon.png", :alt => "В"), "http://vkontakte.ru/share.php?url=http://127.0.0.1:3000/&image=http://127.0.0.1:3000/assets/mic_logo.png&title=Ulgood.ru: #{m.social_user.user.name} #{m.message} "}
						</span>
            <span class = "social_post">
              #{link_to image_tag("facebook-small-icon.png", :alt => "F"), "https://www.facebook.com/dialog/feed?app_id=188628294595434&link=http://aelaa.t.proxylocal.com/&picture=http://aelaa.t.proxylocal.com/assets/mic_logo.png&name=Ulgood.ru&caption=Ulgood.ru:&description=#{m.social_user.username} #{m.message}&redirect_uri=http://aelaa.t.proxylocal.com/"}
						</span>
            <span class = "social_post">
              #{link_to image_tag("twitter-small-icon.png", :alt => "T"), "https://twitter.com/intent/tweet?original_referer=#{request.fullpath}&related=Ulgood.ru&source=tweetbutton&text=Ulgood.ru: #{m.social_user.username} #{m.message}&url=#{root_url}"}
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
