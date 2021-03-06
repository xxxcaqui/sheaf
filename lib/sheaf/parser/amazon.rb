#coding:utf-8

class Sheaf::Parser::Amazon < Sheaf::Parser
  def initialize(filepath)
    @csv = CSV.read(filepath, "r:windows-31j", col_sep: "\t", headers: true)
    @orders = @csv['order-id'].uniq.map{|number| Sheaf::Order.new(number: number) }
  end

  attr_reader :csv, :orders
end
