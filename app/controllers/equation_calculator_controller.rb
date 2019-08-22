class EquationCalculatorController < ApplicationController

  def initialize(json)
    @a = json[:a].to_i
    @b = json[:b].to_i
    @c = json[:c].to_i
    @x_1 = nil
    @x_2 = nil
  end

  def equation_check
    return false if @a == 0
    return x_discriminant_zero if @discriminant == 0
    return x_discriminant_above_zero if @discriminant > 0
    false
  end

  private

  def discriminant
    @discriminant = @b*@b - 4*@a*@c
  end

  def x_discriminant_zero
    +(-@b/2/@a)
  end

  def x_discriminant_above_zero
    @x_1 = +((-@b-Math.sqrt(discriminant))/2/@a)
    @x_2 = +((-@b+Math.sqrt(discriminant))/2/@a)
  end
end
