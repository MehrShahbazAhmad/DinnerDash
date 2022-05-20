# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :string           not null
#  price       :decimal(5, 2)    not null
#  status      :integer          default("active"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
