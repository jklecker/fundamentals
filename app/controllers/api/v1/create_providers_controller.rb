class Api::V1::CreateProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create

  new_provider = Provider.create!(:name => params[:name], :content_area_id => params[:content_area_id], :contentd_delivery_id => params[:contentd_delivery_id])
    render :status => 200,
           :json => { :success => true,
                      :info => "Provider Created",
             :data => { :name => new_provider.name,
                        :content_area_id => new_provider.content_area_id,
                        :delivery_mode_id => new_provider.contentd_delivery_id  }
                    }
  end
  
end