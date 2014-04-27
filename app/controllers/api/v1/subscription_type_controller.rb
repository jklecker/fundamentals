class Api::V1::SubscriptionTypeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  def create
    new_subscription_type = ContentElement.create!(:provider_id => params[:provider_id], :name => params[:name])

	render :status => 200,
           :json => {   :success  => true,
                        :info => "Subcription Created",
                        :data => {
                               }
                    }
  end
end