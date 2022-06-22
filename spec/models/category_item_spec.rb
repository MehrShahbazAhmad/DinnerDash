# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryItem, type: :model do
  context 'Associations Test' do
    it { should belong_to(:item) }
    it { should belong_to(:item) }
  end
end
