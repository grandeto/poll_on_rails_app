class IpAddress < ApplicationRecord
  validates :ip_address, presence: true

  belongs_to :poll
end
