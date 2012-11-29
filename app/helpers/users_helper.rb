# -*- encoding : utf-8 -*-
module UsersHelper

  def get_social_link_icon (provider, url, gray="")
    case provider
      #TODO: Code repeat!
      when "vkontakte"
        social_image = image_tag("vk-icon#{gray}.png", :alt => "vk.com", :class => "round")
      when "facebook"
        social_image = image_tag("facebook-icon#{gray}.png", :alt => "facebook.com", :class => "round")
      when "twitter"
        social_image = image_tag("twitter-icon#{gray}.png", :alt => "twitter.com", :class => "round")
      when "google"
        social_image = image_tag("google-icon#{gray}.png", :alt => "google.com", :class => "round")
    end
    link_to(social_image, url)
  end

  def social_panel
    panel = ""
    social_links = {:vkontakte => "", :facebook => "", :twitter => "", :google => ""}
      @user.social_users.each do |social_user|
        unless params[:id] == current_social_user.id.to_s
          panel += get_social_link_icon social_user.provider, social_user.url
        else
          social_links[social_user.provider.to_sym] = social_user.url
        end
      end
    if params[:id] == current_social_user.id.to_s
      social_links.keys.each do |key|
        if social_links[key].blank?
          panel += get_social_link_icon key.to_s, "", "-gray"
        else
          panel += get_social_link_icon key.to_s, social_links[key]
        end
      end
    end
    panel
  end


  def user_messages
    messages_post = ""
    temp_date = 0
    messages = []
    User.find(params[:id]).social_users.each do |i|
      i.messages.each do |m|
        messages << m
      end
    end
    if messages.empty?
      messages_post += "У пользователя ещё нет добрых дел."
    else
      messages = messages.sort_by {|m| m.created_at}.reverse
      messages.each do |m|
        if (m.created_at.day != temp_date)
          temp_date = m.created_at.day
          messages_post += %{
<br>
<div class = "date">
#{m.created_at.day}.#{m.created_at.month}
</div>
}
        end
        messages_post += "<div class = \"message_item\" onmouseover = \"showSocialButtons(this);\" onmouseout = \"hideSocialButtons(this)\">- #{m.message} <span class = \"social_post\">#{link_to "Удалить", :controller => "message", :action => "delete", :id => m.id if m.social_user == current_social_user || User.find(current_social_user.id).admin? }</span></div>"
      end
      messages_post
    end
  end

  def admin_panel
    if current_social_user.user.admin? || params[:id] == current_social_user.user.id.to_s
%{
  <div style = "font-size: 16px;">
  #{link_to "Удалить страницу", :controller => "users", :action => "delete", :id => params[:id], :method => "post" }
  </div>
}
    end

  end

end
