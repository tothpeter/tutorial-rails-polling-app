class Reply < ActiveRecord::Base
  belongs_to :poll
  has_many :answers

  accepts_nested_attributes_for :answers
  # accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['title'].blank? }
end
