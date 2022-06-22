require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'Validations Test' do
    it { should define_enum_for(:status) }
  end

  context 'Associations Test' do
    it { should have_many(:order_items) }
    it { should have_many(:items) }
    it { should belong_to(:user) }
  end
end
