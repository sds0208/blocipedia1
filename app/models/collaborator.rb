class Collaborator < ApplicationRecord
    has_many :user
    belongs_to :wiki
end
