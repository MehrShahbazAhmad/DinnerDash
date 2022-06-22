# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'Associations Test' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:cart_items) }
    it { is_expected.to have_many(:items) }
  end
end
