class CreateResponsibles < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps null: false
    end
  end
end
