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

  #puts "hsh=#{hsh}"

  queue = num_courses.times.map do |n|
    n
  end

  return false if queue.empty?

  #puts "queue=#{queue}"

  safe_courses = {}

  while !queue.empty? do
    local_queue = [queue.shift]

    #puts "local_queue=#{local_queue}, queue=#{queue}"

    visited = {}
    while !local_queue.empty? do
      c_from = local_queue.shift
      visited[c_from] = true

      if hsh.has_key?(c_from)
        hsh[c_from].each do |c_to|
          return [] if visited.has_key?(c_to)
          local_queue << c_to if !safe_courses.has_key?(c_to)
        end
      end
      safe_courses[c_from] = true
    end
  end

  s = []
  num_courses.times do |n|
    s << n if start_courses[n]
  end
  l = []

  graph = {}
  incoming_graph = {}

  hsh.each do |k, v|
    if !graph.has_key?(k)
      graph[k] = {}
    end

    if !incoming_graph.has_key?(k)
      incoming_graph[v] = {}
    end

    graph[k][v] = true
    incoming_graph[v][k] = true
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


  return l
end
