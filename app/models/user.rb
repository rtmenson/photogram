class User < ApplicationRecord
  # Direct associations

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  has_many   :followers,
             :through => :photos,
             :source => :fans

  has_many   :leaders,
             :through => :liked_photos,
             :source => :user

  has_many   :liked_photos,
             :through => :likes,
             :source => :photo

  # Validations

end
