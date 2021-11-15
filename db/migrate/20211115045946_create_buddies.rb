class CreateBuddies < ActiveRecord::Migration[6.1]
  def change
    create_table :buddies do |t|
      t.string :name
      t.string :species
      t.string :color
      t.integer :age
      t.boolean :adoptable

      t.timestamps
    end
  end
end
