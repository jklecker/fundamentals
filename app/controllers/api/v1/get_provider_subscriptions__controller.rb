class Api::V1::GetProviderSubscriptionsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create
  provider_subscriptions = SubscriptionType.where(:provider_id => params[:provider_id])
    render :status => 200,
           :json => { :success => true,
             :info => "Prvider Subscriptions",
             :data => { 
               "provider subscriptions" => provider_subscriptions}
                    }
  end
end