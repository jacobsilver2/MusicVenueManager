class ShowSerializer < ActiveModel::Serializer
  attributes :id, :date, :start_time, :confirmed, :notes, :user_id
  has_many :acts
end
