class Suica
	attr_accessor :balance

	def initialize(balance)
		if balance >= 100
			@balance = balance
		else 
			puts 'error : チャージ金額は100円以上にしてください'
		end
	end

	def show_balance
		puts "現在のSuicaの残高は #{@balance} 円です。"
	end
end
