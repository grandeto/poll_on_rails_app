class Poll < ApplicationRecord
  validates :name, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9_]/ }, length: { in: 3..255 }

  has_many :ip_addresses, dependent: :destroy
  has_many :poll_options, dependent: :destroy

  accepts_nested_attributes_for :poll_options, :ip_addresses
end
