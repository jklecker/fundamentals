class Api::V1::GetProviderSubscriptionTypesController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create
  provider_sub_type = SubscriptionType.where(:provider_id => params[:provider_id])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Element ",
             :data => { 
               "Subscription Types " => provider_sub_type}
                    }
  end