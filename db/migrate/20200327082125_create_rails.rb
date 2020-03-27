class CreateRails < ActiveRecord::Migration[5.2]
  def change
    create_table :rails do |t|
      t.string :g
      t.string :model
      t.string :Notification

      t.timestamps
    end
  end
end
