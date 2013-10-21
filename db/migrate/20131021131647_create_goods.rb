class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :text
      t.references :account
      t.boolean :checked
      t.integer :repost_count

      t.timestamps
    end
    add_index :goods, :account_id
  end
end
