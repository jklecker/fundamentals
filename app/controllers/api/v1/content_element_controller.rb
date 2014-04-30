class Api::V1::ContentElementController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!


  def create

    new_content_element = ContentElement.create!(:provider_id => params[:provider_id], :name => params[:name], :url_link => params[:url_link], :format_type => params[:format_type])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Element  Created",
             :data => { :name => new_content_element.name,
                        :url_link => new_content_element.url_link,
                        :format_type => new_content_element.format_type,
                        :provider_id => new_content_element.provider_id}
                    }
  end
  
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

  def update
    content = ContentElement.find(params[:id])

    if content.hidden == 0
      content.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Hidden",
                      :data => {"content" => content} } 
    elsif content.hidden.nil?
      content.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Hidden",
                      :data => {"content" => content} } 
    else
      content.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Element Unhidden",
                      :data => {"content" => content} } 
    end 
  end
  
end