# @param {string[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
  edges = {}
  count = 0
  tickets.each do |ticket|
    count += 1
    if !edges.has_key?(ticket[0])
      edges[ticket[0]] = []
    end
    edges[ticket[0]] << ticket[1]
  end

  edges.each do |k ,v|
    v.sort!
  end

  itinereay = ["JFK"]

  while itinereay.length < count + 1 do
    if edges[itinereay.last].nil? || edges[itinereay.last].empty?
      wrong_destination = itinereay.pop
      wrong_destination_index = index_to_insert(edges[itinereay.last], wrong_destination)
      while wrong_destination_index == edges[itinereay.last].length && itinereay.length > 1
        edges[itinereay.last] << wrong_destination
        wrong_destination = itinereay.pop
        wrong_destination_index = index_to_insert(edges[itinereay.last], wrong_destination)
      end
      destination = edges[itinereay.last][wrong_destination_index]
      edges[itinereay.last][wrong_destination_index] = wrong_destination
    else
      destination = edges[itinereay.last].shift
    end
    itinereay << destination
  end

  itinereay
end

def index_to_insert(array, elem)
  return 0 if array.empty?
  return 0if elem < array[0]
  i = 1
  while i < array.length do
    if array[i] > elem && array[i-1] <= elem
      return i
    end
    i += 1
  end
  return array.length
end
