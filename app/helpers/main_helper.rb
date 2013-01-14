# -*- encoding : utf-8 -*-
module MainHelper

  #TODO: DRY this!
  def login_buttons
    out = %{
    <div id="login_buttons">
      <div class="login_icon">#{link_to (image_tag ("vkontakte-icon-gray.png")), "/login?provider=vkontakte"}</div>
      <div class="login_icon">#{link_to (image_tag ("facebook-icon-gray.png")), "/login?provider=facebook"}</div>
      <div class="login_icon">#{link_to (image_tag ("twitter-icon-gray.png")), "/login?provider=twitter"}</div>
      <div class="login_icon">#{link_to (image_tag ("google-icon-gray.png")), "/login?provider=google"}</div>
      <div style="clear:both;"></div>
    </div>
}
  end

  def posts (messages_class)
    posts = ""
    temp_date = 0

    if messages_class == "all"
      messages = Message.where "checked!=0"
    else
      messages = Message.where :created_at => Time.now.midnight..Time.now+60*60*4
      messages = messages.where ("checked!=0")
    end

    if messages.count == 0
      if messages_class != "all"
        posts = "<br>Стань сегодня первым!"
      else
        posts = "<br>Добрых дел ещё нет. Расскажи о своём!"
      end
    else
      messages.reverse.each do |m|
        if (m.created_at.day != temp_date)
          temp_date = m.created_at.day
          posts += %{
#{"<br>" unless m.id==Message.last.id}
<div class = "date">
#{m.created_at.day}.#{m.created_at.month}
</div>
}
        end
        #TODO: Code repeat!
        posts += %{
<div class = "today_list_item" #{'onclick = "show_full(this);" style="cursor:pointer;"' if m.message.length > 50 } onmouseover = "showSocialButtons(this);" onmouseout = "hideSocialButtons(this)">
<a class = "user_name" href = 'users/#{m.social_account.user_id}'>
#{m.social_account.user.name}
</a> #{m.message}
<span class = "social_post">
#{link_to image_tag("vkontakte-small-icon.png", :alt => "В"), "http://vkontakte.ru/share.php?url=http://127.0.0.1:3000/&image=http://127.0.0.1:3000/assets/mic_logo.png&title=Ulgood.ru: #{m.social_account.user.name} #{m.message} "}
</span>
<span class = "social_post">
#{link_to image_tag("facebook-small-icon.png", :alt => "F"), "https://www.facebook.com/dialog/feed?app_id=188628294595434&link=http://aelaa.t.proxylocal.com/&picture=http://aelaa.t.proxylocal.com/assets/mic_logo.png&name=Ulgood.ru&caption=Ulgood.ru:&description=#{m.social_account.username} #{m.message}&redirect_uri=http://aelaa.t.proxylocal.com/"}
</span>
<span class = "social_post">
#{link_to image_tag("twitter-small-icon.png", :alt => "T"), "https://twitter.com/intent/tweet?original_referer=#{request.fullpath}&related=Ulgood.ru&source=tweetbutton&text=Ulgood.ru: #{m.social_account.username} #{m.message}&url=#{root_url}"}
</span>
</div>
}
      end
    end
    posts
  end

  def oldposts (messages_class)
    posts = ""
    messages = Message.all
    messages.reverse.each do |m|
        #TODO: Code repeat!
        posts += %{
					<div class = "today_list_item" #{'onclick = "show_full(this);" style="cursor:pointer;"' if m.message.length > 50 } onmouseover = "showSocialButtons(this);" onmouseout = "hideSocialButtons(this)">
						<a class = "user_name" href = 'users/#{m.social_account.user_id}'>
              #{m.social_account.user.name}
						</a>
						  #{m.message}
						<span class = "social_post">
              #{link_to image_tag("vkontakte-small-icon.png", :alt => "В"), "http://vkontakte.ru/share.php?url=http://127.0.0.1:3000/&image=http://127.0.0.1:3000/assets/mic_logo.png&title=Ulgood.ru: #{m.social_account.user.name} #{m.message} "}
						</span>
            <span class = "social_post">
              #{link_to image_tag("facebook-small-icon.png", :alt => "F"), "https://www.facebook.com/dialog/feed?app_id=188628294595434&link=http://aelaa.t.proxylocal.com/&picture=http://aelaa.t.proxylocal.com/assets/mic_logo.png&name=Ulgood.ru&caption=Ulgood.ru:&description=#{m.social_account.username} #{m.message}&redirect_uri=http://aelaa.t.proxylocal.com/"}
						</span>
            <span class = "social_post">
              #{link_to image_tag("twitter-small-icon.png", :alt => "T"), "https://twitter.com/intent/tweet?original_referer=#{request.fullpath}&related=Ulgood.ru&source=tweetbutton&text=Ulgood.ru: #{m.social_account.username} #{m.message}&url=#{root_url}"}
            </span>
				}

        posts += %{
					</div>
				}
      end
    posts
  end

end
