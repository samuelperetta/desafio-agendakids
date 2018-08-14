class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name
      t.integer :shift
      t.integer :school_unity_id

      t.timestamps null: false
    end
  end
end
