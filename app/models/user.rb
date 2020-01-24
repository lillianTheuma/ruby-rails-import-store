class User < ApplicationRecord
  has_and_belongs_to_many(:roles)
  belongs_to :vendor, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
end
