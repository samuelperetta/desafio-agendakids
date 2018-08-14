require 'factory_girl_rails'

#region Users
@user = User.first_or_create email: 'escola@agendaedu.com', password:'12345678', password_confirmation:'12345678'
#endregion

#region Schools
@school = FactoryGirl.create(:school)
@user.update school: @school
#endregion

#region School Unities
2.times do
  school_unity = FactoryGirl.build(:school_unity)
  school_unity.school = @school
  school_unity.save
end
#endregion

#region Teachers
5.times do
  teacher = FactoryGirl.build(:teacher)
  teacher.school_unities << SchoolUnity.offset(rand(SchoolUnity.count)).limit(1).first
  teacher.save
end
#endregion

#region School Classes
5.times do
  school_class = FactoryGirl.build(:school_class)
  school_class.school_unity = SchoolUnity.offset(rand(SchoolUnity.count)).limit(1).first
  school_class.save
end
#endregion

#region Students
10.times do
  student = FactoryGirl.build(:student)
  student.school_classes << SchoolClass.offset(rand(SchoolClass.count)).limit(1).first
  student.save
end
#endregion

#region Responsibles
15.times do
  responsible = FactoryGirl.build(:responsible)
  responsible.students << Student.offset(rand(Student.count)).limit(1).first
  responsible.students << Student.offset(rand(Student.count)).limit(1).first
  responsible.save
end
#endregion