# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: {user: 0, admin: 1}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, uniqueness: {case_sensitive: false}, length: {minimum:2, maximum:32}
end
