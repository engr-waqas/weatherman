require 'csv'

arr = []

# CSV.foreach(("m.txt"), headers: true, col_sep: ",") do |row|
#   # puts row[0]
#   p row[1].to_i
#   # arr << row[0] << row[1]
# end
# p arr


table = CSV.parse(File.read("m.txt"), headers: true, converters: :numeric)
p table[1]["name"]
p table.by_col[1]
