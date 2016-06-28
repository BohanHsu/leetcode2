require 'minitest/autorun'
require '../lru_cache'

describe 'LRUCache' do
  it 'should work1' do
    @cache = LRUCache.new(5)
    @cache.set(0,0)
    @cache.set(1,1)
    @cache.set(2,2)
    @cache.set(3,3)
    @cache.set(4,4)
    @cache.get(0).must_equal(0)
    @cache.get(1).must_equal(1)
    @cache.get(2).must_equal(2)
    @cache.get(3).must_equal(3)
    @cache.get(4).must_equal(4)
    @cache.get(5).must_equal(-1)
    @cache.set(5,5)
    @cache.get(0).must_equal(-1)
    @cache.get(5).must_equal(5)
    @cache.get(1)
    @cache.set(6,6)
    @cache.get(1).must_equal(1)
    @cache.get(2).must_equal(-1)
  end

  it 'should work2' do
    @cache = LRUCache.new(1)
    @cache.set(0,0)
    @cache.get(0).must_equal(0)
    @cache.set(1,1)
    @cache.get(0).must_equal(-1)
    @cache.get(1).must_equal(1)
    @cache.set(2,2)
    @cache.get(1).must_equal(-1)
    @cache.get(2).must_equal(2)
  end

  it 'should work3' do
    @cache = LRUCache.new(0)
    @cache.set(0,0)
    @cache.get(0).must_equal(-1)
    @cache.set(1,1)
    @cache.get(0).must_equal(-1)
    @cache.get(1).must_equal(-1)
    @cache.set(2,2)
    @cache.get(1).must_equal(-1)
    @cache.get(2).must_equal(-1)
  end
end
