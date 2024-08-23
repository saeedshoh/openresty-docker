local jwt = require "resty.jwt"

local cjson = require "cjson"

local token = ngx.req.get_headers()['x-api-token']

if token == nil then
    ngx.status = ngx.HTTP_UNAUTHORIZED
    ngx.header.content_type = "application/json; charset=utf-8"
    ngx.say("{\"error\": \"missing JWT token or Authorization headesfdefefefr\"}")
    ngx.exit(ngx.HTTP_UNAUTHORIZED)
end

local jwt_obj = jwt:decode(token)

ngx.say("Decoded JWT: ", jwt_obj)
