class AddImageToClowns < ActiveRecord::Migration
  def change
    change_table :clowns do |t|
      t.string :image
    end
  end
end
