class Teacher < ActiveRecord::Base
  validates_presence_of :name, :registration
  validates :registration, length: { maximum: 6 }
  validates_uniqueness_of :registration

  has_and_belongs_to_many :school_unities
end
