class Api::V1::DeleteContentElementController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  def destroy
    
    content = ContentElement.find(params[:id])
    #providers_content = Provider.find_by_content_area_id(content.id)

      content.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Deleted",
             :data => { "names" => content}
                    }

  end
  
end