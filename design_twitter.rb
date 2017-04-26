class Twitter
  attr_accessor :following, :tweets
=begin
    Initialize your data structure here.
=end
  def initialize()
    @tick = 0
    @following = {}
    @tweets = {}
  end

  def tick_tock()
    @tick += 1
  end


=begin
    Compose a new tweet.
    :type userId: Integer
    :type tweetId: Integer
    :rtype: Void
=end
  def post_tweet(userId, tweetId)
    if !@tweets.has_key?(userId)
      @tweets[userId] = []
    end

    @tweets[userId] << [tweetId, @tick + 0]
    tick_tock
  end


=begin
    Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent.
    :type userId: Integer
    :rtype: Integer[]
=end
  def get_news_feed(userId)
    indices = {}
    (@following[userId] + [userId]).each do |uid|
      indices[uid] = (@tweets[uid].nil? ? 0 : @tweets[uid].length) - 1
    end

    to_delete = []
    indices.each do |k, v|
      if v < 0
        to_delete << k
      end
    end

    to_delete.each do |k|
      indices.delete(k)
    end

    feeds = []

    while feeds.length < 10 do
      all_negative = true
      max_uid = -1
      max_tick = -1

      indices.each do |uid, idx|
        if all_negative && idx >= 0
          all_negative = false
        end

        if idx >= 0 && @tweets[uid][idx][1] > max_tick
          max_uid = uid
          max_tick = @tweets[uid][idx][1]
        end
      end

      if all_negative
        break
      end

      feeds << @tweets[max_uid][indices[max_uid]][0]
      indices[max_uid] -= 1
    end

    tick_tock
    return feeds
  end


=begin
    Follower follows a followee. If the operation is invalid, it should be a no-op.
    :type followerId: Integer
    :type followeeId: Integer
    :rtype: Void
=end
  def follow(followerId, followeeId)
    if !@following.has_key?(followerId)
      @following[followerId] = []
    end

    if @following[followerId].find_index(followeeId).nil?
      @following[followerId] << followeeId
    end

    tick_tock
  end


=begin
    Follower unfollows a followee. If the operation is invalid, it should be a no-op.
    :type followerId: Integer
    :type followeeId: Integer
    :rtype: Void
=end
  def unfollow(followerId, followeeId)
    if @following.has_key?(followerId)
      @following[followerId].delete(followeeId)
    end

    tick_tock
  end
end

# Your Twitter object will be instantiated and called as such:
# # obj = Twitter.new()
# # obj.post_tweet(userId,tweetId)
# # param_2 = obj.get_news_feed(userId)
# # obj.follow(followerId,followeeId)
# # obj.unfollow(followerId,followeeId)
