local url, body = ...

if http.checkURL(url) then
    local headers = {}
    http.post(url,body,headers,false)
end