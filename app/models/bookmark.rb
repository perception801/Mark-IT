class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  def likes
    count = $redis.get("#{id}:likes")
    return 0 if count.nil?
    count
  end

  def likes(date) vc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
  end

  def like!(user)
    $redis.incr("#{id}:likes") if $redis.sadd("#{user.id}:likes", id.to_s)
    return true
  end

  def unlike!(user)
    $redis.decr("#{id}:likes") if $redis.srem("#{user.id}:likes", id.to_s)
    return true
  end

  

end


