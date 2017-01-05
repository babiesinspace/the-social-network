class Friendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :user_1_id, null: false
      t.integer :user_2_id, null: false

      t.timestamps(null: false)
    end
  end
end
