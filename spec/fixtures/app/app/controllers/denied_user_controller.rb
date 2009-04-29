class DeniedUserController < TestController
  deny :user => 'roark'
  deny :user => 'kevin'
end
