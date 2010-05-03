class InvestmentsController < ApplicationController
  layout "admin"
  active_scaffold :investment do |config|
  end
end
