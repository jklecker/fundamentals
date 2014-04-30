class Api::V1::SubscriptionTypeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  def create
    new_subscription_type = SubscriptionType.create!(:provider_id => params[:provider_id], :name => params[:name], :subscription_length => params[:subscription_length], :hidden => 0)

	render :status => 200,
           :json => {   :success  => true,
             :info => "Subcription Type Created",
                        :data => {
                                  "Subscription type Info:" => new_subscription_type
                                 }
                    }
  end

  def update
    subscription_type = SubscriptionType.find(params[:id])

    if subscription_type.hidden == 0
      subscription_type.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Type Hidden",
                      :data => {"subscription_type" => subscription_type} } 
    elsif subscription_type.hidden.nil?
      subscription_type.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Type Hidden",
                      :data => {"subscription_type" => subscription_type} } 
    else
      subscription_type.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Type Unhidden",
                      :data => {"subscription_type" => subscription_type} } 
    end 
  end
  
end