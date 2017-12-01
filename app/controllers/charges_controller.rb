class ChargesController < ApplicationController
    def create
        # Creates a Stripe Customer Object
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
        
        # Create a charge
        charge = Stripe::Charge.create(
            customer: customer.id, # (not the same as user id in app)
            amount: 10_00,
            description: "Blocipedia Membership - #{current_user.email}",
            currency: 'usd'
        )
        
        current_user.role = 'premium'
        current_user.save!
        flash[:notice] = "Thanks for purchasing a Blocipedia membership, #{current_user.email}!  You may now create private wikis."
        redirect_to root_path # change to wherever I want it to go

        
        #Stripe will send back CardErrors if something goes wrong, this 'rescue block' catches and displays the errors
        rescue Stripe::CardError => e
            flash[:alert] = e.message
            redirect_to new_charge_path
            
    end
    
    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Blocipedia Membership - #{current_user.email}",
            amount: 10_00
        }
    end
    
    def downgrade
        current_user.role = 'standard'
        current_user.save!
        redirect_to root_path
    end
end
