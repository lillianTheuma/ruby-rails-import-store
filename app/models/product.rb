class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("product.id, product.name, product.cost, product.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("tasks_count DESC")
    .limit(1)
  )}
  scope :name, -> (name_parameter) { where(name: name_parameter)}
  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

  before_save(:titleize_product)
  private
    def titleize_product
      self.name = self.name.titleize
    end
end
