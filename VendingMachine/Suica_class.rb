class Suica
	attr_accessor :balance
	attr_reader   :sex, :age

	def initialize(balance, sex, age)
		if balance >= 100
			@balance = balance
			@sex = sex
			@age = age
		else 
			puts 'error : チャージ金額は100円以上にしてください'
		end
	end

	def show_balance
		puts "このSuicaの残高は #{@balance} 円です。"
	end

	def show_info
		puts "このSuicaの持ち主は #{@sex} で、年齢は #{@age}歳 です。"
	end
end
