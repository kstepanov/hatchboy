require "spec_helper"

feature "sources#new" do
  
  background do
    @customer = create :customer
    @session = sign_in! @customer.account
    @session.visit new_source_path
  end
  
  scenario "it have tab to create JIRA source" do
    @session.click_link("JIRA Source")
    @session.should have_content "Create new JIRA source"
  end
  
end
