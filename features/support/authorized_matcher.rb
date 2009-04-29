class BeAuthorized
  def matches?(response)
    @response = response
    @response.status == "200 OK" && @response.body == 'Allowed Access'
  end

  # ==== Returns
  # String:: The failure message.
  def failure_message
<<-EOS
expected the response from #{@response.request.url}
to have the status 200 OK and body 'Allowed Access'"
but the status is #{@response.status} and the body is '#{@response.body}'"
EOS
end

  # ==== Returns
  # String:: The failure message to be displayed in negative matches.
  def negative_failure_message
<<-EOS
expected the response from #{@response.request.url}
not to have the status 200 Ok and body 'Allowed Access'"
EOS
  end
end

def be_authorized
  BeAuthorized.new
end
