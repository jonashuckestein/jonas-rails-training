class CompaniesController < ApplicationController
  layout "admin"
  active_scaffold :company do |config|
    list.columns.exclude :people
  end
end
