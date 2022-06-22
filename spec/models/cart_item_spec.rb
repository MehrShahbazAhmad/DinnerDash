require 'rails_helper'

RSpec.describe CartItem, type: :model do
  context 'Associations Test' do
    it { should belong_to(:item) }
    it { should belong_to(:cart) }
  end
end
