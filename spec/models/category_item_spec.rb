# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryItem, type: :model do
  context 'when Associations Test' do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:category) }
  end
end
