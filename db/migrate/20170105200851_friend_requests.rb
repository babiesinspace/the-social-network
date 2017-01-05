class FriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.integer :requester_id, null: false
      t.integer :receiver_id, null: false
      t.boolean :accepted, {default: false}

      t.timestamps(null:false)
    end
  end
end
