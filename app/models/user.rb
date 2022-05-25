# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           default(""), not null
#  user_name              :string
#  status                 :integer          default("user"), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { user: 0, admin: 1 }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 32 }
end
