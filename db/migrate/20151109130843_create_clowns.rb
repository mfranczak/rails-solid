class CreateClowns < ActiveRecord::Migration
  def change
    create_table :clowns do |t|
      t.string :name
      t.string :contract

      t.timestamps null: false
    end
  end
end
