class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    has_many :topics, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :likes, dependent: :destroy

    def liked
      Bookmark.find($redis.smembers("#{id}:likes"))
    end

    def liked_ids
      $redis.smembers("#{id}:likes")
    end

    def liked?(bookmark)
      liked_ids.include? bookmark.id.to_s
    end

end
