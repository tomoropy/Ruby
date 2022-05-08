require "date"
require 'optparse'

def create_calender(month)
	year = Date.today.year
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
end

opt = OptionParser.new
opt.on('-m')

argv = opt.parse(ARGV)[0].to_i

# 引数の有無と数値で条件分岐

# 引数がない場合
if argv.zero?
	month = Date.today.mon
	create_calender(month)

# 引数の範囲が正しい場合
elsif argv.between?(1, 12)
	create_calender(argv)

# 引数が12より大きい場合
elsif argv > 12
	puts 'cal: 22 is neither a month number (1..12) nor a name'
end
