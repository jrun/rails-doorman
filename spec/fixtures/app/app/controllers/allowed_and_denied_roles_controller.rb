class AllowedAndDeniedRolesController < TestController
  allow :role => :admin
  deny :role => :troll
end
