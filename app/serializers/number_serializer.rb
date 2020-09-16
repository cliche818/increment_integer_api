class NumberSerializer
  include JSONAPI::Serializer
  set_type :user

  attributes :number
end
