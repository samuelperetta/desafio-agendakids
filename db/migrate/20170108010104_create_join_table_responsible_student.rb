class CreateJoinTableResponsibleStudent < ActiveRecord::Migration
  def change
    create_join_table :responsibles, :students do |t|
      # t.index [:responsible_id, :student_id]
      # t.index [:student_id, :responsible_id]
    end
  end
end
