deck = []
total = 0
sub_total = 0
file = File.open(ARGV.shift)
while line = file.gets
  line.chomp!
  card = line.split(/\s+/)[1]
  if /x\s(\d+)$/ =~ line
    puts line
    num = $1.to_i
    sub_total += num
    total += num
    deck += [[card, deck.size]] * num
  elsif /^-/ =~ line
    puts "#{line} x 1?"
    sub_total += 1
    total += 1
    deck += [[card, deck.size]]
  elsif sub_total > 0
    puts sub_total
    sub_total = 0
  end
end
puts sub_total if sub_total > 0
puts "total: #{total}"

require 'pp'
while line = $stdin.gets
  deck = deck.sort_by{rand}
  pp [deck[0, 7].sort_by{|it| it[1]}.map{|it| it[0]}, deck[7][0]]
end
