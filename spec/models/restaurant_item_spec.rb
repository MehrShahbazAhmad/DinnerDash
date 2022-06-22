# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestaurantItem, type: :model do
  context 'Associations Test' do
    it { should belong_to(:item) }
    it { should belong_to(:restaurant) }
  end
end
