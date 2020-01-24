class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user, optional: true
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, minimum: 50
  validates_length_of :content_body, maximum: 250
  validates :rating, :inclusion=> { :in => [1,2,3,4,5] }

end
