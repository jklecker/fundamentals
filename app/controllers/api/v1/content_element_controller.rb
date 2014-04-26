class Api::V1::ContentItemController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  def index 
    content_areas = ContentElement.all
    provider_content_elements = ContentElement.where(:id => 1).pluck(:provider_id)
      
    
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element",
             :data => { "content_elements" => content_elements}
                    }
  end

  def create

    new_content_element = ContentElement.create!(:provider_id => params[:provider_id], :name => params[:name], :url_link => params[:url_link])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Element  Created",
             :data => { :name => new_content_element.name,
                        :url_link => new_content_element.url_link,
                        :provider_id => new_content_elemenet.provider_id
                    }
  end
end