class CreateJoinTableSchoolUnityTeacher < ActiveRecord::Migration
  def change
    create_join_table :school_unities, :teachers do |t|
      # t.index [:school_unity_id, :teacher_id]
      # t.index [:teacher_id, :school_unity_id]
    end
  end
end
