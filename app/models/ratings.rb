class Ratings < ActiveRecord::Base
  attr_accessible :comments, :rating

  belongs_to :candidate, :guru
end
