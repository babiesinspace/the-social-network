class AddContentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :birthday, :date
    add_column :users, :hometown, :string
    add_column :users, :education, :string
    add_column :users, :relationship_status, :string
    add_column :users, :current_city, :string
  end
end
