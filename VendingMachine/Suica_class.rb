class Suica

	def initialize(balance)
		if balance >= 100
			@balance = balance
		else 
			puts 'error : チャージ金額は100円以上にしてください'
		end
	end

	def show_balance
		puts @balance
	end
end
