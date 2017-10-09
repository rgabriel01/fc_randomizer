class LeadDate < ActiveRecord::Base
  validates :lead_id, presence: true
end