require "./Suica_class.rb"

module VendingMachine

	@@stock = [
		{ name: "コーラ", price: 120, count: 5 }
	]

	# 売上(初期値は0)
	@@sales = 0

	class << self
		# 自販機に飲料を追加
		def add_drink( name, price, count )
			@@stock << { name: name, price: price, count: count }	
		end

		# 自販機の在庫内容を表示
		def show_stock
			@@stock.each do |item|
				puts "商品名 : #{item[:name]}  価格 : #{item[:price]}円  在庫 : #{item[:count]}個"
			end
		end

		#売上を表示
		def show_sales
			puts "現在の自販機の売上は #{@@sales} 円です。"
		end

		# 商品が購入可能か？（在庫量的に）
		def is_there_stock?(name, count)
			@@stock.each do |item|
				if item[:name] == name
					break item[:count] > count
				end
			end
		end

		# 購入合計金額を計算
		def calc_to_total(name, count)
			@@stock.each do |item|
				if item[:name] == name
					break item[:price] * count
				end
			end
		end
		
		# 購入成立した場合の処理
		def purchase_drink(suica, name, count)

			total = calc_to_total(name, count)

			if is_there_stock?(name, count) && suica.balance >= total

				puts " #{name} を #{count} 本購入しました。"
				# 売上に購入金額を追加
				@@sales += total

				# Suicaの残高を購入金額分へらす
				suica.balance -= total
			
			# 在庫数が足りない場合
			elsif !is_there_stock?(name, count)
				puts "error : 購入しようとしている商品は在庫がありません。"

			# Suicaの残高が足りない場合
			elsif suica.balance < total 
				puts "error : Suicaの残高が足りません。"
			end
		end
	end

end

VendingMachine.show_sales
VendingMachine.is_there_stock?("コーラ",3)
VendingMachine.add_drink("カルピス", 130, 10)

suica1 = Suica.new(300)
suica1.show_balance

VendingMachine.purchase_drink(suica1, "カルピス", 2)

VendingMachine.show_sales
suica1.show_balance
