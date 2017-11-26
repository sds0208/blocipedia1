require 'rails_helper'

RSpec.describe Wiki, type: :model do
    let(:wiki) { Wiki.create!(title: "Wiki Title", body: "This is the body of a wiki.") }
    
    it { is_expected.to belong_to(:user) }
  
    describe "attributes" do
        it "has a title, body, and user attribute" do
            expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: wiki.user)
        end
    end
end
