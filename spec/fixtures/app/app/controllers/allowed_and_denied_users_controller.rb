class AllowedAndDeniedUsersController < TestController
  allow :role => :admin
  deny :role => :troll
end
