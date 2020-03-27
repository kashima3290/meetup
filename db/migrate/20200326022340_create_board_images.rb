class CreateBoardImages < ActiveRecord::Migration[5.2]
  def change
    create_table :board_images do |t|
      t.integer :board_id, foreign_key: true
      t.integer :image_id, foreign_key: true
      t.timestamps
    end
  end
end
