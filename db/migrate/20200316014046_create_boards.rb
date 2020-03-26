class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :community_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.string :text
      t.string :image
      t.timestamps
    end
  end
end
