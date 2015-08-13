require 'curb'

def get_body(addr)
  http = Curl.get(addr)
  http.body_str
end