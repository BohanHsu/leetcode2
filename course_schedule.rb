# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
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
          return false if visited.has_key?(c_to)
          local_queue << c_to if !safe_courses.has_key?(c_to)
        end
      end
      safe_courses[c_from] = true
    end
  end

  true
end
