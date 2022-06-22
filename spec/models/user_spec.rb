# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations Test' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:user_name).is_at_most(32) }
    it { should validate_length_of(:user_name).is_at_least(2) }
    it { should validate_presence_of(:password) }
    it { should define_enum_for(:status) }
  end

  context 'Associations Test' do
    it { should have_many(:orders) }
    it { should have_one(:cart) }
  end
end
