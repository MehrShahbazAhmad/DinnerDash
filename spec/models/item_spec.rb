# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'when Validations Test' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to define_enum_for(:status) }
  end

  context 'when Associations Test' do
    it { is_expected.to have_many_attached(:images) }
    it { is_expected.to have_many(:restaurant_items) }
    it { is_expected.to have_many(:restaurants) }
    it { is_expected.to have_many(:category_items) }
    it { is_expected.to have_many(:categories) }
    it { is_expected.to have_many(:cart_items) }
    it { is_expected.to have_many(:order_items) }
  end
end
