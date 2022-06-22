# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context 'Validations Test' do
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'Associations Test' do
    it { is_expected.to have_many(:restaurant_items) }
    it { is_expected.to have_many(:items) }
  end
end
