class CollaboratorsController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @collaborator = Collaborator.new
    end
    
    def create
        @wiki = Wiki.find(params[:wiki_id])
        @user = User.find_by(email: params[:collaborator][:user])
        @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @user.id)
        
        if @collaborator.save
            flash[:notice] = "Collaborator added."
        else
            flash[:alert] = "Collaboration failed."
        end
        
        redirect_to wikis_show_path
    end
  
    def show
    end
  
    def edit
    end
end
