class Api::V1::DeliveryModeController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
   #before_filter :authenticate_user!

  respond_to :json
  
  def index
    
    delivery_modes = DeliveryMode.all
    
        render :status => 200,
                 :json => { :success => true,
                   :info => "Delivery Modes",
                   :data => {"delivery_modes" => delivery_modes}
                          }
    end
  
 
  def create

    new_delivery_mode = DeliveryMode.create!(:name => params[:name], :hidden => 0)
    render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Created",
             :data => { :name => new_delivery_mode }
                    }
  end
  
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
  
  def update
    delivery = DeliveryMode.find(params[:id])

    if delivery.hidden == 0
      delivery.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Hidden",
                      :data => {"delivery" => delivery} } 
    elsif delivery.hidden.nil?
      delivery.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Hidden",
                      :data => {"delivery" => delivery} } 
    else
      delivery.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Unhidden",
                      :data => {"delivery" => delivery} } 
    end 
  end
  
  
end