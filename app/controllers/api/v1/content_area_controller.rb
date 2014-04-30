class Api::V1::ContentAreaController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  def index 
    content_areas = ContentArea.all
      render :status => 200,
           :json => { :success => true,
             :info => "Content Area",
             :data => { "content_areas" => content_areas }
                    }
  end
 def create

    new_content_area = ContentArea.create!(:name => params[:name])
    render :status => 200,
           :json => { :success => true,
             :info => "Content Area Created",
             :data => { :name => new_content_area  }
                    }
  end

   def update
     content_hide = ContentArea.find(params[:id])

    if content_hide.hidden == 0
      content_hide.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Area Hidden",
                      :data => {"content" => content_hide} } 
    elsif content_hide.hidden.nil?
      content_hide.update_column(:hidden, 1)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Area Hidden",
                      :data => {"content" => content_hide} } 
    else
      content_hide.update_column(:hidden, 0)
      render :status => 200,
           :json => { :success => true,
             :info => "Content Area Unhidden",
                      :data => {"content" => content_hide} } 
    end 
  end
  
end