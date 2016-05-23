require 'minitest/autorun'
require '../course_schedule.rb'

describe 'can_finish(num_courses, prerequisites)' do
  it 'should work1' do
    num_courses, prerequisites, expected_result = [2, [[1,0]], true]
    can_finish(num_courses, prerequisites).must_equal(expected_result)

    num_courses, prerequisites, expected_result = [2, [[1,0], [0,1]], false]
    can_finish(num_courses, prerequisites).must_equal(expected_result)
  end
end
