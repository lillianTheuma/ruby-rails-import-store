require 'rails_helper'

describe Role do
  # Tests will go here.
  it { should have_and_belong_to_many :users }
end
