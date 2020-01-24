class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :vendor, optional: true

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :american, -> { where(country_of_origin: "United States")}
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :get_by_vendor, -> (vendor_id) { where(vendor_id: vendor_id)}
  scope :get_by_name, -> (name_parameter) { where(name: name_parameter)}
  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

end
