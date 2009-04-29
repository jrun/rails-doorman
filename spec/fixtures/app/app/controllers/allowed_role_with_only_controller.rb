class AllowedRoleWithOnlyController < TestController
  allow :role => :admin, :only => :show
end
