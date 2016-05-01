# == Schema Information
#
# Table name: campaigns
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  cpi                 :string           not null
#  length_of_interview :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class CampaignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
