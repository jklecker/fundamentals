class Api::V1::GetProviderContentElements < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create
  provider_content_elements = ContentElement.where(:provider_id => params[:provider_id])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Element ",
             :data => { 
               "Content_Elements" => provider_content_elements}
                    }
  end
end