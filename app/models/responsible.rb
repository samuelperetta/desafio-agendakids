class Responsible < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  
  has_and_belongs_to_many :students
  has_many :school_classes, through: :students

	accepts_nested_attributes_for :students, allow_destroy: true

	attr_accessor :student_ids

	def to_s
		return name
	end


end
