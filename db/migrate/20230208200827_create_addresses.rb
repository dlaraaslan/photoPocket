class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :geo_id
      t.string :street
      t.string :suite
      t.string :city
      t.string :zipcode

      t.timestamps
    end
  end
end
