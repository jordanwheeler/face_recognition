class Candidates < ActiveRecord::Base
  attr_accessible :name, :uid

  has_many :photos, :ratings

  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
