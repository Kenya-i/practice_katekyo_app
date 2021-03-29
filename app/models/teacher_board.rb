class TeacherBoard < ApplicationRecord
  belongs_to :teacher
  has_many :contracts
  has_many :parents, through: :contracts
end
