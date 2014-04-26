class Api::V1::CreateProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create

  new_provider = Provider.create!(:name => params[:name]), :content_area_id => params[:content_area_id])
    render :status => 200,
           :json => { :success => true,
                      :info => "Provider Created",
             :data => { :name => new_provider ,
                        :content_area_id => }
                    }
  end
  
end