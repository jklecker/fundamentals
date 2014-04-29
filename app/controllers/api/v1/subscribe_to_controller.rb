class Api::V1::SubscribeToController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create

  new_subscription  = SubscribedTo.create!(:user_id => 1, :provider_id => params[:provider_id], :subscription_id => params[:subscription_id])
    render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Created",
             :data => { :id=> new_subscription.id }
                    }
  end
  
end