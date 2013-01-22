# -*- encoding : utf-8 -*-
module UsersHelper

  def get_social_link_icon (provider, url, gray="")
    social_image = image_tag("#{provider}-icon#{gray}.png", :alt => "#{provider}.com", :class => "round")
    if gray.blank?
      link_to(social_image, url)
    else
      link_to(social_image, "/login?provider=#{provider}&user=#{current_social_account.user.id}&back=#{url_for}")
    end
  end

  def admin_panel
    if current_social_account.user.admin? || params[:id] == current_social_account.user.id.to_s
      %{
  <div style = "font-size: 16px;">
  #{link_to "Удалить страницу", user_path(params[:id])}
  </div>
}
    end
  end

  def social_panel
    panel = ""
    social_links = {:vkontakte => "", :facebook => "", :twitter => "", :google => ""}
    @user.social_accounts.each do |social_account|
      unless params[:id] == current_social_account.user.id.to_s
        panel += get_social_link_icon social_account.provider, social_account.url
      else
        social_links[social_account.provider.to_sym] = social_account.url
      end
    end
    if params[:id] == current_social_account.user.id.to_s
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
    User.find(params[:id]).social_accounts.each do |i|
      i.messages.each do |m|
          messages << m if m.checked? || current_social_account.user.id.to_s == params[:id]
      end
    end
    if messages.empty?
      messages_post += "<br>У пользователя ещё нет добрых дел."
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
        messages_post += %{
        <div class = "message_item" #{ 'onclick = "show_full(this);" style="cursor:pointer;"' if m.message.length > 50 } onmouseover = "showSocialButtons(this);" onmouseout = "hideSocialButtons(this)">
          #{image_tag("#{m.social_account.provider}-small-icon.png")}
          <span style=#{"color:#ccc" unless m.checked?}>
            #{m.message}
          </span>
          <div style="clear:both;"></div>
        </div>
}
      end
      messages_post
    end
  end


end
