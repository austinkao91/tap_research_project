# == Schema Information
#
# Table name: campaign_qualifications
#
#  id                :integer          not null, primary key
#  campaign_quota_id :integer          not null
#  question_id       :integer          not null
#  pre_codes         :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CampaignQualificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
