# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @param {Integer} d
# @param {Integer} e
# @param {Integer} f
# @param {Integer} g
# @param {Integer} h
# @return {Integer}
def compute_area(a, b, c, d, e, f, g, h)
  (c-a) * (d-b) + (g-e) * (h-f) - union(a, b, c, d, e, f, g, h)
end

def union(a, b, c, d, e, f, g, h)
  aa = [a,e].max
  bb = [b,f].max
  cc = [c,g].min
  dd = [d,h].min

  return 0 if cc < aa || dd < bb

  area = (cc-aa) * (dd-bb)
end
