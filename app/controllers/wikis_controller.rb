class WikisController < ApplicationController
    def index
        @user = current_user
        @wikis = Wiki.all
    end
  
    def show
        @wiki = Wiki.find(params[:id])
        @users = User.find_by(id: params[:id])
    end
    def new
        @wiki = Wiki.new
    end
    def create
        @wiki = current_user.wikis.build(wiki_params)
        
        if @wiki.save
            flash[:notice] = "Wiki was saved."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error saving your wiki, please try again."
            render :new
        end
    end
  
    def edit
        @wiki = Wiki.find(params[:id])
        @users = User.find_by(id: params[:id])
        
    end
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.assign_attributes(wiki_params)
      
        if @wiki.save
            flash[:notice] = "Wiki was updated."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the wiki. Please try again."
            render :edit
        end    
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
        
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting the wiki."
            render :show
        end    
    end
    private
    def wiki_params
        params.require(:wiki).permit(:title, :body, :private)
    end
end
