class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.integer :user_id, foreign_key: true
      t.integer :community_id, foreign_key: true
      t.integer :boards_id, foreign_key: true
      t.string :text
      t.string :image
      t.timestamps
    end
  end
end
