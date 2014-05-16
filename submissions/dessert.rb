class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    @calories < 400
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor = flavor
    @name = "#{flavor} jelly bean"
    @calories = 5
  end
  def delicious?
    return super unless @flavor == "licorice" ; false
  end
end
