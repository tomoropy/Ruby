require_relative "./suica_class.rb"
class VendingMachine

  @stocks = { Cola: { price: 100, count: 3 } }

  @sales = 0

  @sales_histories = []

  class << self

    # 自販機の在庫内容を表示
    def show_stocks
      puts "在庫内容".center(40, "*")
      parent_array = []
      @stocks.each do |key, value|
        array = []
        array << key.to_s
        value.each do |v|
          array << v[1].to_s
        end
        parent_array << array
      end
      
      parent_array.each do |item|
        puts "商品名:" + item[0].to_s.rjust(10) + 
        " 価格: " + item[1].to_s.rjust(4) + 
        " 在庫: " + item[2].to_s.rjust(2)
      end
      puts "*" * 44
    end

    # 売上を表示
    def show_sales_money
      puts "現在の自販機の売上は #{@sales} 円です。"
    end

    # 販売履歴を表示
    def show_sales_histories
      puts "販売履歴".center(36, "*")
      @sales_histories.each_with_index do |history, i|
        puts "#{i + 1}: 日時 #{history[:time]}, 性別 #{history[:sex]}, 年齢 #{history[:age]}歳"
      end
      puts "*" * 40
    end
    

    # 自販機に飲料を追加
    def add_drink(name, price, count)
      @stocks[name.to_sym] = { price: price, count: count }
      puts name.to_s.ljust(10) + "が商品に追加されました！"
    end

    # 購入成立した場合の処理
    def purchase_drink(suica, name, count)
      total = calc_to_total(name, count)
      
      if there_stock?(name, count) && suica.balance >= total
        money_proces(suica, total)
        register_info(suica)
        @stocks[name.to_sym][:count] -= 1
        puts name.to_s.ljust(10) + " を#{count}本購入しました。"

      # 在庫数が足りない場合
      elsif !there_stock?(name, count)
        puts 'error : 購入しようとしている商品は在庫がありません。'

      # Suicaの残高が足りない場合
      elsif suica.balance < total
        puts 'error : Suicaの残高が足りません。'
      end
    end

    private

      # お金の処理
      def money_proces(suica, total)
        @sales += total
        suica.balance -= total
      end
      
      # 販売履歴を登録する
      def register_info(suica)
        @sales_histories << { time: Time.now.to_s.slice(0, 9), sex: suica.sex, age: suica.age }
      end
      
      # 商品が購入可能か？（在庫量的に）
      def there_stock?(name, count)
        @stocks[name.to_sym][:count] >= count
      end

      # 購入合計金額を計算
      def calc_to_total(name, count)
        @stocks[name.to_sym][:price] * count
      end
      

  end

end


# # 初期商品在庫を表示
# VendingMachine.show_stocks

# # 商品を追加
# VendingMachine.add_drink("Red bull", 200, 5)
# VendingMachine.add_drink("Water", 100, 5)

# # 在庫内容を表示
# VendingMachine.show_stocks

# # Suicaを発行
# suica1 = Suica.new(400, "男性", 22)
# suica1.show_balance
# suica1.show_info

# # Red Bullと水を購入
# VendingMachine.purchase_drink(suica1, "Red bull", 1)
# VendingMachine.purchase_drink(suica1, "Water", 1)

# # 自販機の売上と販売履歴を表示
# VendingMachine.show_sales_money
# VendingMachine.show_sales_histories

# # Suicaの残高を表示
# suica1.show_balance
