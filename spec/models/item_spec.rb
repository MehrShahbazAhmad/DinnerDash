# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is not valid without a attributes' do
    expect(described_class.create).not_to be_valid
  end

  it 'is valid with a attributes' do
    expect(described_class.create(title: 'foo', description: 'foo bar', price: 0.22)).to be_valid
  end

  it 'is not valid with a nil' do
    expect(described_class.create(title: nil, description: nil, price: nil)).not_to be_valid
  end
end
