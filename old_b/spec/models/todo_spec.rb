require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_at) }
  it { should validate_presence_of(:important) }
  it { should validate_presence_of(:completed) }
end
