require_relative "../lib/suica_class.rb"

RSpec.describe 'Suica' do

  before do
    @suica1 = Suica.new(200, "男性", 22)
  end

  it 'sucia show balance' do
    expect { @suica1.show_balance }.to \
    output("このSuicaの残高は 200 円です。\n").to_stdout
  end

  it 'suica show_info' do
    expect { @suica1.show_info }.to \
    output("このSuicaの持ち主は 男性 で、年齢は 22歳 です。\n").to_stdout 
  end

  it 'suica initalize error' do
    expect {Suica.new(1, "男性", 22)}.to \
    output("error : チャージ金額は100円以上にしてください。\n").to_stdout  
  end
end

