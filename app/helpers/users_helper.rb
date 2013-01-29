# -*- encoding : utf-8 -*-
module UsersHelper

  def get_social_link_icon (provider, url, small="")
    social_image = image_tag("#{provider}-icon.png", :alt => "#{provider}.com", :class => "#{small}")
    if small.blank?
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
          panel += get_social_link_icon key.to_s, "", "small"
        else
          panel += get_social_link_icon key.to_s, social_links[key]
        end
      end
    end
    panel
  end


end
