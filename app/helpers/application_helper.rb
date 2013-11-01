module ApplicationHelper

  include AuthHelper

  def providers
    (OmniAuth::Strategies::OAuth2.descendants +
     OmniAuth::Strategies::OAuth.descendants.reverse).map do |p|
      p.name.split('::').last.downcase
    end
  end
end
