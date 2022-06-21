# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is not valid without a title' do
    expect(described_class.create).not_to be_valid
  end

  it 'is valid with a title' do
    expect(described_class.create(title: 'foo')).to be_valid
  end
end
