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

    new_delivery_mode = DeliveryMode.create!(:name => params[:name])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Created",
             :data => { :name => new_delivery_mode  }
                    }
  end
  
  def destroy
    
    delivery = DeliveryMode.find(params[:id])
    #providers_delivery = Provider.find_by_delivery_mode_id
    #delivery.destroy
    render :status => 200,
           :json => { :success => true,
             :info => "Content Created",
             :data => { "names" => delivery }
                    }
    
  end
  
end