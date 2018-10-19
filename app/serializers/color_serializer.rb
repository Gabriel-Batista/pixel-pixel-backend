class ColorSerializer < ActiveModel::Serializer
  attributes :id, :rgb, :hex
end
