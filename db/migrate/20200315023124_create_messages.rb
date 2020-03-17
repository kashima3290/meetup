class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.string :image
      t.references :community, foreign_key: true
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.timestamps
    end
  end
end
