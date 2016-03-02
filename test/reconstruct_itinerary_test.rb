require 'minitest/autorun'
require '../reconstruct_itinerary'

describe 'find_itinerary(tickets)' do
  it 'should work1' do
    tickets = [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
    expected_result = ["JFK", "MUC", "LHR", "SFO", "SJC"]
    find_itinerary(tickets).must_equal(expected_result)

    tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
    expected_result = ["JFK","ATL","JFK","SFO","ATL","SFO"]
    find_itinerary(tickets).must_equal(expected_result)

    tickets = []
    expected_result = ["JFK"]
    find_itinerary(tickets).must_equal(expected_result)
  end

  it 'should work2' do
    tickets = [["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]
    expected_result = ["JFK", "NRT", "KUL"]
    find_itinerary(tickets).must_equal(expected_result)
  end
  
end
