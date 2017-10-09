require 'minitest/autorun'
require '../design_twitter'

describe '' do
  before do
    @twitter = Twitter.new
    @twitter.follow(1,2)
    @twitter.follow(1,3)
    @twitter.follow(1,4)
    @twitter.follow(1,5)
    @twitter.follow(1,6)
    @twitter.follow(2,3)
    @twitter.follow(2,4)
    @twitter.follow(2,6)
    @twitter.unfollow(2,6)

    @twitter.post_tweet(1, 10001)
    @twitter.post_tweet(1, 10002)
    @twitter.post_tweet(1, 10003)
    @twitter.post_tweet(1, 10004)
    @twitter.post_tweet(1, 10005)
    @twitter.post_tweet(1, 10006)
    @twitter.post_tweet(1, 10007)

    @twitter.post_tweet(2, 10008)
    @twitter.post_tweet(2, 10009)

    @twitter.post_tweet(3, 10010)
    @twitter.post_tweet(3, 10011)

    @twitter.post_tweet(4, 10012)
    @twitter.post_tweet(4, 10013)

    @twitter.post_tweet(5, 10014)
    @twitter.post_tweet(5, 10015)

    @twitter.post_tweet(1, 10016)
  end

  it 'should follow' do
    @twitter.following[1].sort.must_equal([2,3,4,5,6])
    @twitter.following[2].sort.must_equal([3,4])
  end
  it 'should unfollow' do
    @twitter.unfollow(1,2)
    @twitter.unfollow(1,3)
    @twitter.unfollow(1,4)
    @twitter.following[1].sort.must_equal([5,6])
  end

  it 'should post twitter' do
    (@twitter.tweets[1].map {|p| p[0]}).sort.must_equal([10001,10002,10003,10004,10005,10006,10007,10016].sort)
  end

  it 'should fetch feeds' do
    @twitter.get_news_feed(1).must_equal([10016,10015,10014,10013,10012,10011,10010,10009,10008,10007])
    @twitter.get_news_feed(2).must_equal([10013,10012,10011,10010, 10009,10008])
  end
end

describe 'run code test' do
  before do
    @twitter = Twitter.new
    @twitter.post_tweet(1,5)
    @twitter.get_news_feed(1)
    @twitter.follow(1,2)
    @twitter.post_tweet(2,6)
    @twitter.get_news_feed(1)
    @twitter.unfollow(1,2)
    @twitter.get_news_feed(1)
  end
  it 'should init' do
    # do nothing
  end
end
