require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)

puts file

toys_data = JSON.parse(file)

puts toys_data.class


# Print today's date
require 'date'

current_time = DateTime.now

date_today = current_time.strftime "%d/%m/%Y"

puts "Today's date is: " + date_today 

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "
 
  toys_data["items"].each { |toy| 
    puts toy["title"] #prints name of the toy
    puts "**************************************"   #Saperator
    puts "The retail price : " + toy["full-price"].to_s + " USD" #prints retail price of the toy
    puts "Total Purchases  : #{toy["purchases"].length.to_i}" #prints total number of purchases
    
    total_amount = 0    # Calculates and prints the total amount of sales
    toy["purchases"].each { |purchase|
    total_amount += purchase["price"].to_f
    }
    puts "Total Sales      : #{total_amount} USD"

    total_amount = 0                            # Calculate and print the average price the toy sold for  !!!!!!!!!!!!!!!!!!!!wrong               
    toy["purchases"].each { |purchase|
      total_amount += purchase["price"].to_f
    }
    puts "Average Price    : #{total_amount/toy["purchases"].length} USD" 

    puts "Average Discount : #{toy["full-price"].to_f - total_amount/toy["purchases"].length} USD"
    

    puts "                                      " #Empty Line
    }
  


  puts " _                         _     "
  puts "| |                       | |    "
  puts "| |__  _ __ __ _ _ __   __| |___ "
  puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
  puts "| |_) | | | (_| | | | | (_| \\__ \\"
  puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
  puts

  toy_prices = Array.new
  

  toys_data["items"].each { |toy| 

    toy_price = { "Brand" => toy["brand"], "Price" => toy["full-price"].to_f, "Recurrance" => 1 }

   toy_prices.push(toy_price)
  

  }


    puts toy_prices
puts "============================"



  toy_prices_dump = Array.new

  toy_prices.each { |toy_item| #toy item is a brand : price hash
      
      
    if toy_prices_dump.count > 0
        
        toy_prices_dump.each { |toy_item_dump|
            
            
            a = toy_item_dump["Brand"]
            
            b = toy_item["Brand"]
#            c =
            puts "a class is: " + a.class.to_s + " which holds brand named: " + a
            
            puts "b class is: " + b.class.to_s + " which holds brand named: " + b


            if a.eql? b
                
                current_cumulative = toy_item_dump["Price"] * toy_item_dump["Recurrance"]
                
                new_price = (current_cumulative + toy_item["Price"]) / (toy_item_dump["Recurrance"] + 1)
                
                toy_item_dump["Price"] = new_price
                
                toy_item_dump["Recurrance"] += 1
                
            else
                
                toy_prices_dump.push(toy_item)
                
                puts "lvl 2 toy_prices_dump array now holds: " + toy_prices_dump.to_s
                
            end 
            
        }

    else
    
        toy_prices_dump.push(toy_item)
        
        puts "lvl 1 toy_prices_dump array now holds: " + toy_prices_dump.to_s

    end

  }

  toy_prices_dump.each { |toy_to_print|
      
    puts toy_to_print
  }
  
      
  # Calculate and print the average price of the brand's toys
  
  # Calculate and print the total revenue of all the brand's toy sales combined

