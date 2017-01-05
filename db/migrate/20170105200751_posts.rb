class Posts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.integer :receiver_id

      t.timestamps(null:false)
    end
  end
end
