# -*- encoding : utf-8 -*-
class DeviseCreateSocialUsers < ActiveRecord::Migration
  def change
    create_table(:social_users) do |t|
      t.string :username
      t.string :nickname
      t.string :provider
      t.string :url
      t.string :user_id

      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip


      t.timestamps
    end

    add_index :social_users, :email,                :unique => true
  end
end
