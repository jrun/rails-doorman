class AccessControlByUserAgent < TestController
  deny :user_agent => /MSIE/
  allow :user_agent => /iPhone/
end
