class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki
    
    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end 
   
    def update?
        user.admin? or not wiki.published?
    end

    class Scope
        attr_reader :user, :scope
        
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
        
        def resolve
            wikis = []
            if user.role == 'admin'
                wikis = scope.all
            elsif user.role == 'premium'
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if wiki.private? == false || wiki.user == user || wiki.collaborators.include?(user)
                        wikis << wiki
                    end
                end
            else
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if wiki.private? == false || wiki.collaborators.include?(user)
                        wikis << wiki
                    end
                end
            end
            wikis
        end
    end    
end
