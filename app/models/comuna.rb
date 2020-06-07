class Comuna < ApplicationRecord
  belongs_to :region
  has_many :eventos
  has_many :eventoadmins
end
