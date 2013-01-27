# -*- encoding : utf-8 -*-
module MainHelper

  #TODO: DRY this!
  def login_buttons
    out = %{
      <div class="login_icon">#{link_to (image_tag ("vkontakte-icon-gray.png")), "javascript:", :onclick => "window.open('/login?provider=vkontakte','myWnd','height=500,width=500');"}</div>
      <div class="login_icon">#{link_to (image_tag ("facebook-icon-gray.png")), "javascript:", :onclick => "window.open('/login?provider=facebook','myWnd','height=500,width=500');"}</div>
      <div class="login_icon">#{link_to (image_tag ("twitter-icon-gray.png")), "javascript:", :onclick => "window.open('/login?provider=twitter','myWnd','height=500,width=500');"}</div>
      <div class="login_icon", style="margin-right:0">#{link_to (image_tag ("google-icon-gray.png")), "javascript:", :onclick => "window.open('/login?provider=google','myWnd','height=500,width=500');"}</div>
      <div style="clear:both;"></div>
}
  end

end
