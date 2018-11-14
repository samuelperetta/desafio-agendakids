class Student < ActiveRecord::Base
  validates_presence_of :name, :registration
  validates_uniqueness_of :registration

  has_and_belongs_to_many :school_classes
  has_and_belongs_to_many :responsibles

  accepts_nested_attributes_for :responsibles, allow_destroy: true

  attr_accessor :responsible_ids

  def to_s
  	return name
  end
end
