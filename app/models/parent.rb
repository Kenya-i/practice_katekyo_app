class Parent < ApplicationRecord
  has_many :contracts
  has_many :teacher_boards, through: :contracts

  has_secure_password
end
