class DeniedRoleController < TestController
  deny :role => :troll
end
