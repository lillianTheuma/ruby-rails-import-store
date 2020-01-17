class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, maximum: 250
  validates_length_of :content_body, minimum: 50
  validates :rating, :inclusion=> { :in => [1,2,3,4,5] }

  before_save(:titleize_author)

  private
    def titleize_author
      self.author = self.author.titleize
    end
end
