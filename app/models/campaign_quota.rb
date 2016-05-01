# == Schema Information
#
# Table name: campaign_quotas
#
#  id          :integer          not null, primary key
#  campaign_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CampaignQuota < ActiveRecord::Base
  validates :campaign_id, :presence => true
  has_many :campaign_qualifications
end
