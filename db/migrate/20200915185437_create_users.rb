class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :api_token

      t.timestamps
    end

    add_index :users, :api_token, unique: true
    add_index :users, :email, unique: true
  end
end
