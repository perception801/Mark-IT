module LikesHelper
  def like
    $redis.incr(:likes)
  end

  def dislike
    $redis.decr(:likes)
  end


end
