class SchoolsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @school_unities = current_user.school.school_unities
    @student_count = Student.count
    @responsible_count = Responsible.count
  end
end
