class Photos < ActiveRecord::Base
  attr_accessible :pid, :tid, :uids, :url

  belongs_to :candidate, :guru

  validates :pid, presence: true, uniqueness: true
  validates :tid, presence: true, uniqueness: true
  validates :url, presence: true
end
