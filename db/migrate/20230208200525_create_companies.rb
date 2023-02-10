class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :catch_pharse
      t.string :bs
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
