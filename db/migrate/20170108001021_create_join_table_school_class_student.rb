class CreateJoinTableSchoolClassStudent < ActiveRecord::Migration
  def change
    create_join_table :school_classes, :students do |t|
      # t.index [:school_class_id, :student_id]
      # t.index [:student_id, :school_class_id]
    end
  end
end
