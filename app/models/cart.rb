class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def remove_item(id)
    contents[id.to_s] -= 1
    if contents[id.to_s] == 0
      contents.delete(id.to_s)
    end
  end

  def count_of(id)
    contents[id.to_s] || 0
  end

  def cart_items
    contents.transform_keys {|key| Item.find(key.to_i)}
  end

  def total_price
    cart_items.sum  {|item, quantity| item.price * quantity}
  end

  def update_quantity(id, new_quantity)
    contents[id.to_s] = new_quantity
  end


end
