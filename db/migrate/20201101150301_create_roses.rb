class CreateRoses < ActiveRecord::Migration
  def change
    create_table :roses do |t|
      t.integer :user_id
      t.string :rose_name
      t.string :rose_type
      t.string :description
      t.string :image
     
    end
  end
end
