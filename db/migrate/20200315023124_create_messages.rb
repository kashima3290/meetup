class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.string :image
      t.integer :community_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.integer :board_id, foreign_key: true
      t.timestamps
    end
  end
end
