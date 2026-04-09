class Stretch < ApplicationRecord
  enum target_area: {
    shoulder: 0,
    neck: 1,
    lower_back: 2
  }

  validates :name, presence: true, length: { maximum: 10 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :target_area, presence: true
  validates :steps, presence: true

  has_many :records, dependent: :destroy
end
