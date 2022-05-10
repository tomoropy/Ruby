require_relative "../lib/Suica_class.rb"

RSpec.describe Suica do
  it "initialize error" do
    expect(Suica.new(10, "男性", 22)).to eq "error : チャージ金額は100円以上にしてください"
  end
end

