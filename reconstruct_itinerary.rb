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

  departure = "JFK"
  itinereay = [departure]

  count.times do
    puts "destination=#{departure}, edges=#{edges[departure]}"
    if edges[departure].empty?
    else
      destination = edges[departure].shift
      itinereay << destination
      departure = destination
    end
  end

  itinereay
end
