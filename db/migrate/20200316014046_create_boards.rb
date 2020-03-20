class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :text
      t.string :image
      t.string :community_id, foreign_key: true
      t.timestamps
    end
  end
end
