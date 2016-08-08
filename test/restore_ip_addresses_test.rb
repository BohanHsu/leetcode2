require 'minitest/autorun'
require '../restore_ip_addresses'

describe 'restore_ip_addresses(s)' do
  it 'should work1' do
    s = "25525511135"
    expected_result = ["255.255.11.135", "255.255.111.35"]
    restore_ip_addresses(s).sort.must_equal(expected_result.sort)

    s = "010010"
    expected_result = ["0.10.0.10","0.100.1.0"]
    restore_ip_addresses(s).sort.must_equal(expected_result.sort)

    s = "0000"
    expected_result = ["0.0.0.0"]
    restore_ip_addresses(s).sort.must_equal(expected_result.sort)
  end
end
