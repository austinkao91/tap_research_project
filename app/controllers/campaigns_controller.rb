class CampaignsController < ApplicationController
  def ordered_campaigns
    @campaigns = Campaign.includes(campaign_quotas: :campaign_qualifications).all

    if(@campaigns.empty?)
      campaign_data = []
      quota_data = []
      qual_data = []

      campaign_path = "/campaigns"
      campaign_JSON = query_tap_research(campaign_path)

      campaign_JSON.each do |campaign|
        quota_qual_path = "/campaigns/#{campaign["id"]}"
        quota_qual_JSON = query_tap_research(quota_qual_path)

        quota_JSON = quota_qual_JSON["campaign_quotas"]
        quota_JSON.each do |quota|
          qual_JSON = quota["campaign_qualifications"]
          qual_data.concat(format_data(qual_JSON, "CampaignQualification", quota["id"], "CampaignQuota"))
        end
        quota_data.concat(format_data(quota_JSON, "CampaignQuota", quota_qual_JSON["id"], "Campaign"))
      end

      campaign_data.concat(format_data(campaign_JSON, "Campaign"))

      cache_data(campaign_data, "Campaign")
      cache_data(quota_data, "CampaignQuota")
      cache_data(qual_data, "CampaignQualification")

      @campaigns = Campaign.includes(campaign_quotas: :campaign_qualifications).all
    end
    render "campaigns/index.html.erb"
  end


  private



end
