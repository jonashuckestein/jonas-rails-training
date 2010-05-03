class RolesController < ApplicationController
  layout "admin"
  active_scaffold :role do |config|
# TODO why doesn't this work?!
#    config.columns[:person].ui_type = :select
#    config.columns[:company].ui_type = :select
  end

end
