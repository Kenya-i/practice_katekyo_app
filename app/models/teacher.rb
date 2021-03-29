class Teacher < ApplicationRecord
  has_many :teacher_boards, dependent: :destroy

  has_secure_password
end
