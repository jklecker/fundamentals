class Api::V1::SubscribeToController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   before_filter :authenticate_user!

  respond_to :json

  
  
  def update
    subscription_type = SubscribedTo.find(params[:id])

    if subscription_type.hidden == 0
      subscription_type.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Hidden",
                      :data => {"subscription" => subscription_type} } 
    elsif subscription_type.hidden.nil?
      subscription_type.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Hidden",
                      :data => {"subscription" => subscription_type} } 
    else
      subscription_type.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Unhidden",
                      :data => {"subscription" => subscription_type} } 
    end 
  end
  
end