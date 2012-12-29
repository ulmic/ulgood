# -*- encoding : utf-8 -*-
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :social_user_id
      t.integer :checked
      t.timestamps
    end
  end
end
