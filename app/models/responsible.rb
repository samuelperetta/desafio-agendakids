class Responsible < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email

  has_and_belongs_to_many :students
  has_many :school_unities, through: :students
end
