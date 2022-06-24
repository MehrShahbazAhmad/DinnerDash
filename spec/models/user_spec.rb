# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when Validations Test' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:user_name).is_at_most(32) }
    it { is_expected.to validate_length_of(:user_name).is_at_least(2) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to define_enum_for(:status) }
  end

  context 'when Associations Test' do
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_one(:cart) }
  end
end
