require "date"

year = Date.today.year
month = Date.today.mon
index_of_day = Date.new(year, month, 1).wday
last_date = Date.new(year, month, -1).day

puts "#{month}月 #{year}".center(20)
puts "日 月 火 水 木 金 土"
print "   " * index_of_day


(1..last_date).each do |date|
	print date.to_s.rjust(2) + " "
	
	index_of_day += 1

	print "\n" if (index_of_day % 7 == 0)
end

print "\n"