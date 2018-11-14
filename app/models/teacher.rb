class Teacher < ActiveRecord::Base
  validates_presence_of :name, :registration
  validates :registration, length: { maximum: 6 }
  validates_uniqueness_of :registration

  has_and_belongs_to_many :school_unities

  accepts_nested_attributes_for :school_unities, allow_destroy: true

  attr_accessor :school_unity_ids

  def to_s
		return name
	end
end
