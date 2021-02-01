#tara is testing git

grocery_shelf = [
      {:item => "AVOCADO", :price => 3.00, :clearance => true},
      {:item => "KALE", :price => 3.00, :clearance => false},
      {:item => "BLACK_BEANS", :price => 2.50, :clearance => false},
      {:item => "ALMONDS", :price => 9.00, :clearance => false},
      {:item => "TEMPEH", :price => 3.00, :clearance => true},
      {:item => "CHEESE", :price => 6.50, :clearance => false},
      {:item => "BEER", :price => 13.00, :clearance => false},
      {:item => "PEANUTBUTTER", :price => 3.00, :clearance => true},
      {:item => "BEETS", :price => 2.50, :clearance => false},
      {:item => "SOY MILK", :price => 4.50, :clearance => true},
]

unconsolidated_cart = [
  {:item => "BEETS", :price => 2.50, :clearance => false},  
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]

def find_item_by_name_in_collection(name, collection)
  return_item = {}
  collection.each do | item |
    if item[:item] == name
      return_item = item
    end
  end  
  if return_item == {}
    return nil
  else
    p return_item
    return return_item
  end  
end


def consolidate_cart(cart)
  entries = [] #inits variable for consolidated cart
  entry_keys = [] #inits variable for key list,  used for comparisons (not very DRY I know!)
  cart.each do | cart_item | #loops over the cart items
    if entry_keys.include?(cart_item[:item]) # checks if we have an entry key for this item
      found_item = entries.find { | line_item | line_item[:item] == cart_item[:item] } #if found, returns the entry line_item
      found_item[:count] += 1 # increments the count
      p cart_item[:item] + " duplicate found"
      p found_item
    else # if there is no entry
      cart_item[:count] = 1 # sets the initial count at 1
      entries << cart_item # adds the item hash to the consolidated cart 
      entry_keys << cart_item[:item] # adds the name of the item to the comparison list
      p cart_item[:item] + " new"
    end
  end
  p entries
  return entries
end  


# testy(unconsolidated_cart)

consolidate_cart(unconsolidated_cart)
 