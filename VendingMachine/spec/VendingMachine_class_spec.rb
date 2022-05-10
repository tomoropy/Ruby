require_relative "../lib/suica_class.rb"
require_relative "../lib/vending_machine_class.rb"

RSpec.describe 'VendingMachine' do

	before do
		@suica1 = Suica.new(400, "男性", 22)
	end

  it 'sucia show balance' do
		expect { @suica1.show_balance }.to \
		output("このSuicaの残高は 400 円です。\n").to_stdout
  end

	it 'show stocks' do
		expect{VendingMachine.show_stocks}.to \
		output("******************在庫内容******************
商品名 : Cola       値段 : 120  在庫数 : 5 
********************************************\n").to_stdout  
	end

	it 'add drink Red bull' do
		expect{VendingMachine.add_drink("Red bull", 200, 5)}.to \
		output("Red bull  が商品に追加されました！\n").to_stdout
	end

	it 'add drink Water' do
		expect{VendingMachine.add_drink("Water", 100, 5)}.to \
		output("Water     が商品に追加されました！\n").to_stdout
	end

	it 'show stocks after add drink' do
		expect{VendingMachine.show_stocks}.to \
		output("******************在庫内容******************
商品名 : Cola       値段 : 120  在庫数 : 5 
商品名 : Red bull   値段 : 200  在庫数 : 5 
商品名 : Water      値段 : 100  在庫数 : 5 
********************************************\n").to_stdout  
	end
	
	it 'buy one Redbull' do
		expect{VendingMachine.purchase_drink(@suica1, "Red bull", 1)}.to \
		output("Red bull   を1本購入しました。\n").to_stdout	
	end

	it 'buy one Water' do
		expect{VendingMachine.purchase_drink(@suica1, "Water", 1)}.to \
		output("Water      を1本購入しました。\n").to_stdout	
	end

	it 'show sales money' do
		expect{VendingMachine.show_sales_money}.to \
		output("現在の自販機の売上は 300 円です。\n").to_stdout	
	end

	it 'show sales histories' do
		expect{VendingMachine.show_sales_histories}.to \
		output("****************販売履歴****************
1: 日時 2022-05-1, 性別 男性, 年齢 22歳
2: 日時 2022-05-1, 性別 男性, 年齢 22歳
****************************************\n").to_stdout	
	end

	it 'show suica balance' do
		expect{
			VendingMachine.purchase_drink(@suica1, "Cola", 1)
			@suica1.show_balance
		}.to output("Cola       を1本購入しました。\nこのSuicaの残高は 280 円です。\n").to_stdout			
	end
end
