class Api::V1::UserProvidersController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  def index
 time = Time.now.to_i
        time2 = 0
        all_subscriptions = SubscribedTo.all
        all_subscriptions.each do |i|
          time2 = i.end_date
          if time2.nil?
            i.destroy
          elsif time2 < time
            EndedSubscription.create!(:old_id => i.id, :user_id => i.user_id, :provider_id => i.provider_id, :subscription_id => i.subscription_id, :subscription_type => i.subscription_type, :end_date_time => i.end_date_time, :end_date => i.end_date)
            i.destroy
          end
          
        end
    
        subscriptions = SubscribedTo.where(:user_id => current_user.id).pluck(:provider_id)
        #subscriptions = SubscribedTo.where(:user_id => 1).pluck(:provider_id)
        my_providers = Provider.where(:id => subscriptions) 
        #my_providers = Provider.all

    
        render :status => 200,
                 :json => { :success => true,
                            :info => "My Subscriptions",
                            :data => {"providers" => my_providers}
                          }  
  end
def destroy
    
    provider = Provider.find(params[:id])
    content_elements = ContentElement.find_by_provider_id(provider)
    
    if content_elements.nil?
      provider.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Provider Deleted",
             :data => { "names" => provider}
                    }
    else 
      render :status => 403,
           :json => { :success => false,
             :info => "Delete Failed",
             :data => {"names" => content_elements} }
    end
  end
end
