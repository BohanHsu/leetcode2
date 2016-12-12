require 'minitest/autorun'
require '../implement_strstr'

describe 'str_str(haystack, needle)' do
  it 'should work1' do
    haystack = "safjkl;asfkl;qejfjdks;qelgjesjklfeqf"
    needle = "kl;qejfjd"
    str_str(haystack, needle).must_equal(burtal_force(haystack, needle))

    haystack = "safjkl;asfkl;qejfjdks;qelgjesjklfeqf"
    needle = "esjklfeqf"
    str_str(haystack, needle).must_equal(burtal_force(haystack, needle))

    haystack = "safjkl;asfkl;qejfjdks;qelgjesjklfeqf"
    needle = "esjklfeqf$"
    str_str(haystack, needle).must_equal(burtal_force(haystack, needle))
  end
end

def burtal_force(haystack, needle)
  haystack.length.times do |i|
    if haystack.length - i >= needle.length
      if haystack[i...(i+needle.length)] == needle
        return i
      end
    end
  end
  return -1
end
