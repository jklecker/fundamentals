class Api::V1::SubscribeToController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json
  
def create

   time = Time.new
    length = params[:subscription_type]
    temp = length.split(" ")
    seconds = temp[0].to_i
    if (temp[1].eql? "months") || (temp[1].eql? "month")
      time_per_division = 2635200
    elsif (temp[1].eql? "days") || (temp[1].eql? "day")
      time_per_division = 86400
    elsif (temp[1].eql? "years") || (temp[1].eql? "year")
      time_per_division = 31536000
    else
      render :status => 403,
           :json => { :success => false,
             :info => "Invalid Subscription Type",
                      :data => {} }
    end
    seconds = seconds*time_per_division
    end_date = time + seconds
    new_subscription = SubscribedTo.create!(:user_id => current_user.id, :provider_id => params[:provider_id], :subscription_id => params[:subscription_id], :subscription_type => params[:subscription_type], :end_date_time => end_date, :end_date => end_date)
    #new_subscription = SubscribedTo.create!(:user_id => params[:user_id], :provider_id => params[:provider_id], :subscription_id => params[:subscription_id], :subscription_type => params[:subscription_type], :end_date_time => end_date, :end_date => end_date)
       
    render :status => 200,
           :json => { :success => true,
                      :info => "Subscription Created",
             :data => { "subscription" => new_subscription,
               :start_date => time}
                    }
  end
  
  def destroy
    
    subscription = SubscribedTo.find(params[:id])
    #providers_content = Provider.find_by_content_area_id(content.id)

      subscription.destroy
      render :status => 200,
           :json => { :success => true,
             :info => "Subscription Deleted",
             :data => { "subscription" => subscription}
                    }

  end
  
end