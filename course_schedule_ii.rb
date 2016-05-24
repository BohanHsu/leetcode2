# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  hsh = {}
  start_courses = {}

  num_courses.times do |n|
    start_courses[n] = true
  end

  prerequisites.each do |prerequisite|
    p_from, p_to = prerequisite
    if !hsh.has_key?(p_from)
      hsh[p_from] = []
    end
    hsh[p_from] << p_to
    start_courses[p_to] = false
  end


  s = []
  num_courses.times do |n|
    s << n if start_courses[n]
  end
  l = []

  graph = {}
  incoming_graph = {}

  hsh.each do |k, vs|
    vs.each do |v|
      if !graph.has_key?(k)
        graph[k] = {}
      end

      if !incoming_graph.has_key?(v)
        incoming_graph[v] = {}
      end

      graph[k][v] = true
      incoming_graph[v][k] = true
    end
  end


  while !s.empty? do
    n = s.shift
    l << n
    if graph.has_key?(n)
      graph[n].keys.each do |m|
        # remove edge n->m
        graph[n].delete(m)
        incoming_graph[m].delete(n)
        
        if incoming_graph[m].keys.size == 0
          s << m
        end
      end
    end
  end

  graph.each do |k, vh|
    return [] if vh.size != 0
  end

  return l.reverse
end
