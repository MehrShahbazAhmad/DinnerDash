# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'Validations Test' do
    it { should validate_presence_of(:title) }
  end

  context 'Associations Test' do
    it { should have_many(:restaurant_items) }
    it { should have_many(:items) }
  end
end
