# -*- encoding : utf-8 -*-
class CreateSocialAccounts < ActiveRecord::Migration
  def change
    create_table :social_accounts do |t|
      t.string :username
      t.string :nickname
      t.string :provider
      t.string :url

      t.integer :user_id

      t.timestamps
    end
  end
end
