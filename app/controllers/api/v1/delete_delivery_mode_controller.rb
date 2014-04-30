class Api::V1::DeleteDeliveryModeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  
  def destroy
    
    delivery = DeliveryMode.find(params[:id])
    providers_delivery = Provider.find_by_delivery_mode_id(delivery.id)
    #delivery.destroy
    
    if providers_delivery.nil?
      delivery.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Deleted",
             :data => { "names" => delivery,
                        "providers" => providers_delivery}
                    }
    else 
      render :status => 403,
           :json => { :success => false,
             :info => "Delete Failed Provider Still Has Delivery Mode",
                      :data => {"names" => delivery,
                                "providers" => providers_delivery} }
    end    
  end
  
end
  
  