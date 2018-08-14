class CreateSchoolUnities < ActiveRecord::Migration
  def change
    create_table :school_unities do |t|
      t.string :name
      t.string :address
      t.integer :school_id

      t.timestamps null: false
    end
  end
end
