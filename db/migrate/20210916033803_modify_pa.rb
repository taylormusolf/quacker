class ModifyPa < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :pa
    add_column :users, :pa, :string 
  end
end
