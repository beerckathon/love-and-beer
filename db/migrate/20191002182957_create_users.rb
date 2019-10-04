class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login_id
      t.string :profile
      t.string :image_url
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :login_id, unique: true
  end
end
