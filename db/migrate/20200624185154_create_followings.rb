class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, null: false, foreign_key: { to_table: 'users' }
      t.references :followed, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
    add_index :followings, [:follower_id, :followed_id], unique: true
  end
end
