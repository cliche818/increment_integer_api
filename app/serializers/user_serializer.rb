class UserSerializer
  include JSONAPI::Serializer
  attributes :api_token, :email
end
