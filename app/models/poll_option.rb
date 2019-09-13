class PollOption < ApplicationRecord
  validates :option, presence: true, format: { with: /[a-zA-Z0-9_]/ }, length: { in: 3..255 }
  validates :priority, presence: true, numericality: true
  validates :votes, numericality: true

  belongs_to :poll
  default_scope { order(priority: :asc) }
end
