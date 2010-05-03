class PeopleController < ApplicationController
  layout "admin"
  active_scaffold :person do |config|
    list.columns.exclude :companies
    
  end
end
