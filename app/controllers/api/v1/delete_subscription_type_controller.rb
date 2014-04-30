class Api::V1::DeleteSubscriptionTypeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
  
  
  def destroy
    
    subscription_type = SubscriptionType.find(params[:id])
    #providers_content = Provider.find_by_content_area_id(content.id)

      subscription_type.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Type Deleted",
             :data => { "subscription type" => subscription_type}
                    }

  end
  
end