class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :text
      t.string :image
      t.timestamps
    end
  end
end
