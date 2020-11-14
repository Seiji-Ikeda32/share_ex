class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :title
      t.string :content
      t.string :place
      
      t.timestamps
    end
  end
end
