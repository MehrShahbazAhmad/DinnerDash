# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Validations Test' do
    it { should validate_presence_of(:title) }
  end

  context 'Associations Test' do
    it { should have_many(:category_items) }
    it { should have_many(:items) }
  end
end
