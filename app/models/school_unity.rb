class SchoolUnity < ActiveRecord::Base
  validates_presence_of :name, :address
  validates_uniqueness_of :name
  before_save :default_values

  belongs_to :school
  has_many :school_classes
  has_and_belongs_to_many :teachers

  def to_s
  	return self.name
  end

  def default_values
    self.school_id ||= School.first.id 
  end
end
