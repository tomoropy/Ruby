module VendingMachine

	@@stock = [
		{ name: "コーラ", price: 120, count: 5 }
	]

	def self.add_drink( name, price, count )
		@@stock << { name: name, price: price, count: count }	
	end

	def self.show_stock
		@@stock.each do |item|
			puts "商品名 : #{item[:name]}  価格 : #{item[:price]}円  在庫 : #{item[:count]}個"
		end
	end
end
