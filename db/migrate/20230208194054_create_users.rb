class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.integer :address_id
      t.integer :phone
      t.string :website
      t.integer :company_id 

      t.timestamps
    end
  end
end
