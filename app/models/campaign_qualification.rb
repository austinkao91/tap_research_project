# == Schema Information
#
# Table name: campaign_qualifications
#
#  id                :integer          not null, primary key
#  campaign_quota_id :integer          not null
#  question_id       :integer          not null
#  pre_codes         :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CampaignQualification < ActiveRecord::Base
  validates :campaign_quota_id, :question_id, :pre_codes, :presence => true
  def pre_codes=(code)
    if(code.is_a?(Array))
      self[:pre_codes] = code.join(",")
    else
      self[:code] = code
    end
  end

end
