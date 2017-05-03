# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'rest_poc@gmail.com', password: 'password123')
User.create(email: 'rest_poc_1@gmail.com', password: 'password123')

if (DineTable.count == 0)
	10.times do |count|
			DineTable.create(table_number: count+1)
	end
end

if (MenuItem.count == 0)
	MenuItem.create(name: "Tea", category: "Drinks", price: 2, item_image_file_name: "tea.jpg" )
	MenuItem.create(name: "Coffee", category: "Drinks", price: 3, item_image_file_name: "coffee.jpg" )
	MenuItem.create(name: "Cool Drinks", category: "Drinks", price: 3, item_image_file_name: "cooldrinks.jpg" )
	MenuItem.create(name: "Cool Coffee", category: "Drinks", price: 2, item_image_file_name: "coolcofee.jpg" )
	MenuItem.create(name: "Pizza", category: "Food", price: 5, item_image_file_name: "pizza.jpg" )
	MenuItem.create(name: "Chips", category: "Food", price: 3, item_image_file_name: "chips.jpg" )
	MenuItem.create(name: "Biryani", category: "Food", price: 8, item_image_file_name: "biryani.jpg" )
end

if (Waiter.count == 0)
	Waiter.create(name: "Albert", e_id: "005")
	Waiter.create(name: "Kieth", e_id: "006")
	Waiter.create(name: "Boob", e_id: "007")
	Waiter.create(name: "Tod", e_id: "008")
	Waiter.create(name: "Criss", e_id: "009")
	Waiter.create(name: "Antony", e_id: "010")
end

if (Order.count == 0)
	for i in 1..20
		dine_type = ['Food','Drinks'].sample
		max_items = MenuItem.available_items(dine_type).count
		selected_items = MenuItem.available_items(dine_type).sample(rand( max_items == 0 ? 1 : max_items  ))
		table_id = DineTable.all.map(&:id).sample
		if (selected_items.length > 0)
			order = Order.create(dine_table_id: table_id, order_state: 'Settled', category: dine_type, waiter_id: Waiter.all.map(&:id).sample)
			selected_items.each do |item|
			  OrderItem.create(item.attributes.slice("name", "category", "price").merge({order_id: order.id}))
			end
		end
		begin
			order.update(order_state: "Settled", created_at: Time.now - rand(100).days)
		rescue Exception => e
			p "@@@@@@@@@@@@@@@@@@@ RUN AGAIN @@@@@@@@@@@@@@@@@"
		end

	end
end