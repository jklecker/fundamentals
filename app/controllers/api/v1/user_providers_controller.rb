class Api::V1::UserProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  def index
        subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        my_providers = Provider.where(:id => subscriptions) 

	render :status => 200,
           :json => { :success => true,
                      :info => "My Subscriptions",
                      :data => {

                                   "providers" => my_providers
                                   
                               }
                    }
  end
def create

    new_provider = Provider.create!(:user_id => current_user.id, :name => provider_name )
    render :status => 200,
           :json => { :success => true,
                      :info => "Provider Created",
             :data => { :name => provider_name  }
                    }
  end
end
