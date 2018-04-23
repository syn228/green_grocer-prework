require 'pry'
def consolidate_cart(cart)
  sorted_cart = {}
  count = 0
  cart.each do |lists|
    lists.each do |fruit, detail|
      sorted_cart[fruit] ||= detail
      sorted_cart[fruit][:count] ||= 0
      sorted_cart[fruit][:count] += 1
    end
  end
  sorted_cart
end

def apply_coupons(cart, coupons)
<<<<<<< HEAD
  new_hash = cart
  coupons.each do |coupon_notes|
    # add coupon to cart
    item = coupon_notes[:item]

    if !new_hash[item].nil? && new_hash[item][:count] >= coupon_notes[:num]
      sale = {"#{item} W/COUPON" => {:price => coupon_notes[:cost], :clearance => new_hash[item][:clearance], :count => 1}}
      
      if new_hash["#{item} W/COUPON"].nil?
        new_hash.merge!(sale)
      else
        new_hash["#{item} W/COUPON"][:count] += 1
        #new_hash["#{item} W/COUPON"][:price] += coupon_notes[:cost]
      end
      
      new_hash[item][:count] -= coupon_notes[:num]
    end
  end
  new_hash
end
      
      

def apply_clearance(cart)
  cart.each do |fruits, details|
    if details[:clearance] == true
      details[:price] = (details[:price] * 0.8).round(2)
    end
  end
  cart
=======
  hash = cart
  coupons.each do |coupon_hash|
    # add coupon to cart
    item = coupon_hash[:item]

    if !hash[item].nil? && hash[item][:count] >= coupon_hash[:num]
      temp = {"#{item} W/COUPON" => {
        :price => coupon_hash[:cost],
        :clearance => hash[item][:clearance],
        :count => 1
        }
      }
      
      if hash["#{item} W/COUPON"].nil?
        hash.merge!(temp)
      else
        hash["#{item} W/COUPON"][:count] += 1
        #hash["#{item} W/COUPON"][:price] += coupon_hash[:cost]
      end
      
      hash[item][:count] -= coupon_hash[:num]
    end
  end
  hash
>>>>>>> eb2c5fd0d0e8073ee38307d7c6102b13bb43d1a2
end
      
      

def checkout(cart, coupon)
 cart = consolidate_cart(cart)
  coupon_cart = apply_coupons(cart, coupon)
  clearance_cart = apply_clearance(coupon_cart)
  
  total = 0
  
  clearance_cart.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end
  
  total > 100 ? total * 0.9 : total
  
end
