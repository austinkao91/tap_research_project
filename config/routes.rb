Rails.application.routes.draw do
  root to: "campaigns#ordered_campaigns"
  get 'campaigns/ordered_campaigns' => "campaigns#ordered_campaigns"
end
