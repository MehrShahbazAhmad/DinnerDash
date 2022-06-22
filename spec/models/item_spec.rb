# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'Validations Test' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should define_enum_for(:status) }
  end

  context 'Associations Test' do
    it { should have_many_attached(:images) }
    it { should have_many(:restaurant_items) }
    it { should have_many(:restaurants) }
    it { should have_many(:category_items) }
    it { should have_many(:categories) }
    it { should have_many(:cart_items) }
    it { should have_many(:order_items) }
  end
end
