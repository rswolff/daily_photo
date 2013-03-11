class Like < ActiveRecord::Base
  attr_accessible :photo_id, :subscriber_id

  belongs_to :subscriber
  belongs_to :photo
  
end
