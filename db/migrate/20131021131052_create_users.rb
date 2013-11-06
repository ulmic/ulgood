class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar
      t.boolean :admins

      t.timestamps
    end
  end
end
