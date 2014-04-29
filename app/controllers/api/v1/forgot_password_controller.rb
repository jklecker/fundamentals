class Api::V1::ForgotPasswordController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
# Just skip the authentication for now
   #before_filter :authenticate_user!
  respond_to :json
  
 def create

   check_email = User.where(:email => params[:email]
    
     if check_email != nil
     check_email.send_reset_password_instructions
       
       render :status => 200,
           :json => { :success => true,
             :info => "Sending Email Instructions to Reset Password",
             :data => { :email => check_email  }
                    }
     else
     render :status => 400,
             :json => { :success => false,
             :info => "Email Not Found",
             :data => { :email => check_email  }
               }
               end
     end


end