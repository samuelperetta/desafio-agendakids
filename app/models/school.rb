class School < ActiveRecord::Base
  validates_presence_of :name, :cnpj
  validates_uniqueness_of :cnpj

  has_many :school_unities
  has_many :users
end
