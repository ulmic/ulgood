# -*- encoding : utf-8 -*-
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.string :checked

      t.integer :social_account_id

      t.timestamps
    end
  end
end
