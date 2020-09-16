class AddNumberToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :number, :integer, default: 0, null: false
  end
end
