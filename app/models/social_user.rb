# -*- encoding : utf-8 -*-
class SocialUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  attr_accessible :nickname, :provider, :url, :username, :user_id
  # attr_accessible :title, :body

  belongs_to :user
  has_many :messages

  def self.find_for_facebook_oauth access_token, current_cookies

    if user = SocialUser.where(:url => access_token.info.urls.Facebook).first
      user
    else
      if current_cookies[:user].nil? || current_cookies[:user].blank?
        new_user = User.create!(:name => access_token.info.name)
      else
        if current_cookies[:provider].to_s == access_token.provider.to_s
          new_user = current_cookies[:user]
        end
      end
      SocialUser.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20], :user_id => new_user)
    end
  end

  def self.find_for_vkontakte_oauth access_token, current_cookies
    if user = SocialUser.where(:url => access_token.info.urls.Vkontakte).first
      user
    else
      if current_cookies[:user].nil? || current_cookies[:user].blank?
        new_user = User.create!(:name => access_token.info.name)
      else
        if current_cookies[:provider] == access_token.provider
          new_user = current_cookies[:user]
        end
      end
      SocialUser.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => access_token.extra.raw_info.domain+'@vk.com', :password => Devise.friendly_token[0,20], :user_id => new_user)
    end
  end

  def self.find_for_twitter_oauth access_token, current_cookies
    if user = SocialUser.where(:url => access_token.info.urls.Twitter).first
      user
    else
      if current_cookies[:user].nil? || current_cookies[:user].blank?
        new_user = User.create!(:name => access_token.info.name)
      else
        if current_cookies[:provider] == access_token.provider
          new_user = current_cookies[:user]
        end
      end
      SocialUser.create!(:provider => access_token.provider, :url => access_token.info.urls.Twitter, :username => access_token.info.name, :nickname => access_token.info.nickname, :email => access_token.info.nickname+"@twitter.com", :password => Devise.friendly_token[0,20], :user_id => new_user)
    end
  end

  def self.find_for_google_oauth access_token, current_cookies
    if user = SocialUser.where(:email => access_token.info.email).first
      user
    else
      if current_cookies[:user].nil? || current_cookies[:user].blank?
        new_user = User.create!(:name => access_token.info.name)
      else
        if current_cookies[:provider] == access_token.provider
          new_user = current_cookies[:user]
        end
      end
      SocialUser.create!(:provider => access_token.provider, :url => "mailto:" + access_token.info.uid, :username => access_token.info.name, :nickname => access_token.info.name, :email => access_token.info.email, :password => Devise.friendly_token[0,20], :user_id => new_user)
    end
  end

end
