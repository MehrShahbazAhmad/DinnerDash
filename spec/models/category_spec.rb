# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'when Validations Test' do
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'when Associations Test' do
    it { is_expected.to have_many(:category_items) }
    it { is_expected.to have_many(:items) }
  end
end
