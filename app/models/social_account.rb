# -*- encoding : utf-8 -*-
class SocialAccount < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username, :user_id

  belongs_to :user
  has_many :messages, :dependent => :destroy

  def self.find_for_facebook_oauth access_token, cookies

    if social_account  = SocialAccount.where(:url => access_token.info.urls.Facebook).first
      if cookies[:user].present?
	social_account.user_id=cookies[:user]
	cookies[:user] = ""	
      end
      social_account.save!
      social_account
    else
      if cookies[:user].present?
        new_user = User.find(cookies[:user])
        cookies[:user] = ""
      else
        new_user= User.create!(:name => access_token.info.name, :avatar => "anonim.jpg")
      end
      SocialAccount.create!(
          :provider => access_token.provider,
          :url => access_token.info.urls.Facebook,
          :username => access_token.extra.raw_info.name,
          :nickname => access_token.extra.raw_info.username,
          :email => access_token.extra.raw_info.email,
          :password => Devise.friendly_token[0,20],
          :user_id => new_user.id
      )
    end

  end



 def self.find_for_vkontakte_oauth access_token, cookies

    if social_account  = SocialAccount.where(:url => access_token.info.urls.Vkontakte).first
            if cookies[:user].present?
        social_account.user_id=cookies[:user]
        cookies[:user] = ""
      end
      social_account.save!
      social_account
    else
      if cookies[:user].present?
        new_user = User.find(cookies[:user])
        cookies[:user] = ""
      else
        new_user = User.create!(:name => access_token.info.name, :avatar => access_token.extra.raw_info.photo_big)
      end
      SocialAccount.create!(
          :provider => access_token.provider,
          :url => access_token.info.urls.Vkontakte,
          :username => access_token.info.name,
          :nickname => access_token.extra.raw_info.screen_name,
          :email => access_token.extra.raw_info.screen_name+"@vk.com",
          :password => Devise.friendly_token[0,20],
          :user_id => new_user.id
      )
    end

  end


  def self.find_for_twitter_oauth access_token, cookies
    if social_account  = SocialAccount.where(:url => access_token.info.urls.Twitter).first
            if cookies[:user].present?
	social_account.user_id=cookies[:user]
	cookies[:user] = ""	
      end
      social_account.save!
      social_account
    else
      if cookies[:user].present?
        new_user = User.find(cookies[:user])
        cookies[:user] = ""
      else
        new_user = User.create!(:name => access_token.info.name, :avatar => "anonim.jpg")
      end
      SocialAccount.create!(
          :provider => access_token.provider,
          :url => access_token.info.urls.Twitter,
          :username => access_token.info.name,
          :nickname => access_token.info.nickname,
          :email => access_token.info.nickname+'@twitter.com',
          :password => Devise.friendly_token[0,20],
          :user_id => new_user.id
      )
    end

  end

  def self.find_for_google_oauth access_token, cookies

    if social_account  = SocialAccount.where(:email => access_token.info.email).first
            if cookies[:user].present?
	social_account.user_id=cookies[:user]
	cookies[:user] = ""	
      end
      social_account.save!
      social_account
    else
      if cookies[:user].present?
        new_user = User.find(cookies[:user])
        cookies[:user] = ""
      else
        new_user = User.create!(:name => access_token.info.name, :avatar => "anonim.jpg")
      end
      SocialAccount.create!(
          :provider => access_token.provider,
          :url =>  "mailto:" + access_token.info.uid,
          :username => access_token.info.name,
          :nickname => access_token.info.name,
          :email => access_token.info.email,
          :password => Devise.friendly_token[0,20],
          :user_id => new_user.id
      )
    end

  end


end
