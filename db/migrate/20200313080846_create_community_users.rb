class CreateCommunityUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :community_users, id: :integer do |t|
      t.integer :community_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
