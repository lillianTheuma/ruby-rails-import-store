require 'rails_helper'

describe Product do
  # Tests will go here.
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }

end
