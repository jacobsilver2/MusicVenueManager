class ActSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :blurb
  # belongs_to :show
  has_many :shows
end
