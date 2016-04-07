require 'minitest/autorun'
require '../first_bad_version'

def is_bad_version(version)
  return version >= @versions[:is_bad_version]
end

describe 'first_bad_version(n)' do
  it 'should work1' do
    @versions = {
      :version_number => nil,
      :is_bad_version => nil 
    }

    (1...100).each do |j|
      max_version = j
      (1..max_version).each do |i|
        @versions[:version_number] = max_version
        @versions[:is_bad_version] = i
        first_bad_version(@versions[:version_number]).must_equal(@versions[:is_bad_version])
      end
    end
  end

end
