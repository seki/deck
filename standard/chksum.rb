total = 0
sub_total = 0
while line = gets
  line.chomp!
  if /x\s(\d+)$/ =~ line
    puts line
    sub_total += $1.to_i
    total += $1.to_i
  elsif /^-/ =~ line
    puts "#{line} x 1?"
    sub_total += 1
    total += 1
  elsif sub_total > 0
    puts sub_total
    sub_total = 0
  end
end
puts sub_total if sub_total > 0
puts "total: #{total}"
