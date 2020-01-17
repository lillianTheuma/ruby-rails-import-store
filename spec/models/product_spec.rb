require 'rails_helper'

describe Product do
  # Tests will go here.
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titleizes the name of an product") do
    product = Product.create({name: "marketing"})
    expect(product.name()).to(eq("Marketing"))
  end
end
