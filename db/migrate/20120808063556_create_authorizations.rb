class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :profile_link
      t.string :image_link
      t.string :token
      
      t.timestamps
    end
  end
end
