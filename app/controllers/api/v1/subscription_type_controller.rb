class Api::V1::SubscriptionTypeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  def create
    new_subscription_type = SubscriptionTypes.create!(:provider_id => params[:provider_id], :name => params[:name], :subscription_length => params[:subscription_length])

	render :status => 200,
           :json => {   :success  => true,
                        :info => "Subcription Created",
                        :data => {
                        :name => new_subscription_type.name,
                          :provider_id => new_subscription_type.provider.id,
                          :subscrition_length => new_subscription_type.subscription_length
                               }
                    }
  end
end