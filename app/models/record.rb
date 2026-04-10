class Record < ApplicationRecord
  validates :date, presence: true
  validates :stretch_id, presence: true

  belongs_to :stretch

  scope :recent, -> { order(date: :desc) }
end
