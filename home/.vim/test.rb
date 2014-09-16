hexa = '1110101001111100010101111000000010011011';#ARGV[0]

e = true
s = ''
hexa.each_char do |m|
  c = (m == '1') ^ e ? '1' : '0'
  puts "#{m} #{e} #{c}"
  s += c
  e = c == '1'
end

puts hexa
puts s
## puts ''
## puts s.to_i(2)
## puts s.to_i(10)
## puts s.to_i(8)
## puts s.to_i(16
p Integer('0b' + s)
p "%#+x" % Integer('0b' + s)
