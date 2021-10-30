class AddAgeAndPaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pa, :string, null: false
    add_column :users, :age, :integer, null: false
    add_index :users, :pa
  end
end
