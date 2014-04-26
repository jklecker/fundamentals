class Api::V1::FormatController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  def create

    new_format  = CreateFormats.create!(:name => params[:name])
    render :status => 200,
           :json => { :success => true,
                      :info => "Format Created",
             :data => { :name=> new_format }
                    }
  end
end