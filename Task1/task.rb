class InventoryItem

    @@inventory = []

    def initialize(name,category,price,quantity)
        @name = name
        @category = category
        @price = price
        @quantity = quantity

        item = {
            name: @name,
            category: @category,
            price: @price,
            quantity: @quantity
        }
        @@inventory<<item
    end

    # getter of class variable
    def self.inventory
        @@inventory
    end

    # function to add item
    def self.add_item
        puts "Add Item --> Fill Details"
        
        print "Name : "
        name = gets.chomp
        print "Category : "
        category = gets.chomp
        print "Price : "
        price = gets.chomp.to_i
        print "Quantity : "
        quantity = gets.chomp.to_i
        puts "\n"
        item = InventoryItem.new(name,category,price,quantity)
    
        puts InventoryItem.inventory
        puts "\n"
    end

    # method to return total value of inventory
    def self.total_value
        value = @@inventory.reduce(0){|val,item| val + (item[:price] * item[:quantity])}
    end

    # printing using the hash
    def display_item_hash
        item = {
            name: @name,
            category: @category,
            price: @price,
            quantity: @quantity
        }
        item.each{|key,val| puts "#{key} : #{val}\n"}
    end

    # printing an item
    def display_item
        p "Item : #{@name}"
        p "Category : #{@category}"
        p "Price : #{@price}"
        p "Quantity : #{@quantity}"
    end

    # checks the quantity of item 
    def quantity_check
        if(@quantity < 10)
            puts "Low Quantity, order more. Current Quantity : #{@quantity}"
        else
            puts "Sufficient Quantity. Current Quantity : #{@quantity}"
        end
    end
end

class DiscountedItem < InventoryItem

        def initialize(name, category, price, quantity, discount_percentage)
            @name = name
            @category = category
            @price = price
            @quantity = quantity
            @discount_percentage = discount_percentage
            item = {
                name: @name,
                category: @category,
                price: @price,
                quantity: @quantity,
                discount_percentage: @discount_percentage 
            }
            @@inventory<<item
        end

        # overriding the display method
        def display_item
            p "Item : #{@name}"
            p "Category : #{@category}"
            p "Price : #{@price}"
            p "Quantity : #{@quantity}"
            p "Discount Percentage : #{@discount_percentage}%"
        end
end

# Creating instances and displaying them
item1 = InventoryItem.new("CBGK-16 Mechanical Keyboard","Peripherals",2500,20)
item1.display_item
puts "\n"

item2 = InventoryItem.new("i5 11400H","Proccessor",25000,7)
item2.display_item
puts "\n"

item3 = InventoryItem.new("Green Soul Beast Chair","Furniture",14000,10)
item3.display_item
puts "\n"

# printing the inventory array 
InventoryItem.inventory.each{|item| puts "#{item} \n"}
puts "\n"

# printing using the hash
item1.display_item_hash
puts "\n"
item2.display_item_hash
puts "\n"
item3.display_item_hash
puts "\n"

# qunatity check
item1.quantity_check
puts "\n"
item2.quantity_check
puts "\n"
item3.quantity_check
puts "\n"

# add item functionality
InventoryItem.add_item

# adding a discounted item
item4 = DiscountedItem.new("Lenovo 400","Peripherals",700,20,10)
item4.display_item                                          # overrided display_item method
puts "\n"

puts InventoryItem.inventory
puts "\n"

# total value of inventory
puts "Total value of Inventory : #{InventoryItem.total_value}"