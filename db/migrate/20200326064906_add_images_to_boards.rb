class AddImagesToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :images, :string
  end
end
