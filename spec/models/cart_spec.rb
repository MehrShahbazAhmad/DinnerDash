require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'Associations Test' do
    it { should belong_to(:user) }
    it { should have_many(:cart_items) }
    it { should have_many(:items) }
  end
end