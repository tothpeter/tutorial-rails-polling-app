class Poll < ActiveRecord::Base
  has_many :questions
  has_many :replies

  validates_presence_of :title
end
