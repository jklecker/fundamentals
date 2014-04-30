class Api::V1::DeleteFormatController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
  def destroy
    
    content = Format.find(params[:id])
    content_element = ContentElement.find_by_format_id(content.id)
    
    
    if content_element.nil?
      content.destroy
      render :status => 200,
             :json => { :success => true,
                        :info => "Content Element Deleted",
                        :data => { "formats" => content,
                                   "content elements" => content_element}
                    }
    else 
      render :status => 403,
             :json => { :success => false,
                        :info => "Delete Failed Content Element Still Has Format",
                        :data => {"formats" => content,
                                  "content elements" => content_element} }
    end
  end
  
end