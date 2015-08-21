require 'curb'

# TODO http authentication, cookies, user agent

def get_body(addr)
  http = Curl.get(addr, timeout: 2)
  http.body_str
end