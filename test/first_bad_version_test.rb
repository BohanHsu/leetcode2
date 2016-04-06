require 'minitest/autorun'
require '../first_bad_version'

def is_bad_version(version)
  idx = @versions[:version_number].find_index(version)
  return @versions[:is_bad_version][idx]
end

describe 'first_bad_version(n)' do
  it 'should work1' do
    @versions = {
      :version_number => [1,2,3,4,5,6,7],
      :is_bad_version => [false] * 3 + [true] * 4
    }

    first_bad_version(@versions[:version_number]).must_equal(4)
  end
end
