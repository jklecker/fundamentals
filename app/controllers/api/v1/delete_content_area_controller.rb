class Api::V1::DeleteContentAreaController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json


def destroy
    
    content = ContentArea.find(params[:id])
    providers_content = Provider.find_by_content_area_id(content.id)
   
    
   if providers_content.nil?
      content.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Delivery Mode Deleted",
             :data => { "names" => content,
                        "providers" => providers_content}
                    }
    else 
      render :status => 403,
           :json => { :success => false,
             :info => "Delete Failed Because Provider Still Has Content Area",
                      :data => {"names" => content,
                                "providers" => providers_content} }
    end
  end

end