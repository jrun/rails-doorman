class AccessControlByHostController < TestController
  allow :all
  allow :host => 'allowed.example.org'
  deny :host => 'denied.example.org'
end
