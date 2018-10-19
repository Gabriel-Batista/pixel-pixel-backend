class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :token

  def token
    token = JWT.encode({user_id: object.id}, "1756tech7788learn0891money")
  end
end
