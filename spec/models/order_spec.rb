# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'when Validations Test' do
    it { is_expected.to define_enum_for(:status) }
  end

  context 'when Associations Test' do
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to have_many(:items) }
    it { is_expected.to belong_to(:user) }
  end
end
