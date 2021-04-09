class ThrowDice
  def initialize(dices)
    @dices   = dices
    @result_dices = []
  end

  def call
    if valid_input?
      play
      Result.new("#{dices.size} were rolled", result_dices, sum_of_dice_result)
    else
      Result.new("#{0} were rolled", 0, 0)
    end
  end

  def generate_number(dice)
    rand(1..dice)
  end  

  def array_of_dices
    dices.split(",").map(&:to_i)
  end  

  def play
    array_of_dices.each{|dice| result_dices << generate_number(dice)}
  end  

  def sum_of_dice_result
    result_dices.inject(0){|sum,x| sum + x }
  end  

  def valid_input?
    dices =~ /^\d+(,\d+)*$/ ? true : false
  end  

  private

  attr_reader :dices, :result_dices
end

class Result

  attr_accessor :description, :value, :total

  def initialize(description, value, total)
    @description = description
    @value = value
    @total = total
  end

  def to_ary
    [description, value, total]
  end

end