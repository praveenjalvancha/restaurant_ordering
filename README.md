# Hey thank you so much for giving me this opportunity

# I have tried my level best to fullfill your requirements 

# Used devise for authentication and bootstrap for User Interface


# Here are the steps to run the application

# Application is on Ruby 2.2.3 and Rails 5.0

# Extract the zip folder and change your dirctory to application folder

# make sure that Ruby and rails are installed in your maechine

  		* run bundle install

   		  * rake db:drop

        * rake db:create

        * rake db:migrate

        * rake db:seed

        * run rails s (Go to localhost:3000 in the browser)
 


----------------------------------------------------------------------------------------------------------------------
        * sudo add-apt-repository ppa:ecometrica/servers


        * sudo apt-get update


        * sudo apt-get install wkhtmltopdf


        * sudo ln -s /usr/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

# i have not given link anywhere in the application.
navigate to /home/report_pdf.pdf manually
------------------------------------------------------------------------------------------------------------------------
        * run rails test
            # to run the unit test cases


        



# Intially you will land on the Dine tables page from there if you want to reserve the table click on "Book Dine" button then you need to sign_up/sign_in to reserve the table
         There i kept 4 fields there you can choose dine type, Number of persons, allotted waiter, picking the food to order

# Once you click on order to kitchen the table will be reserved and the status of the table will be changed to not available

#  In the dine tables tab you can find the show orders for that specific table. click on show orders there you can find settle option once you click on settle(We can consider this as the payment has 

done) Then table will be free from the reservation and status would be changed to available to Book dine

#  In the orders tab you can find all the orders entered by the waiters 

#  In the  Menu we can able to see the items available for dine.  waiters can add item to menu with image (to upload image used paperclip gem ). waiter can add/edit/delete  
items from the menu 

# To populate the dummy data wrote scripts in seeds.rb

# I have written unit test cases for controllers and models

# Wrote web services

Get all dine_tables API call
URL: http://localhost:3000/api/v1/dine_tables
Request: GET
Header : APP_ACCESS_TOKEN => Password
example
{
  "ResponseCode": 200,
  "Count": 11,
  "dining_tables": [
    {
      "id": 1,
      "table_number": "1",
      "status": "Not Available",
      "created_at": "2017-03-19T20:15:25.717Z",
      "updated_at": "2017-03-19T21:46:18.903Z",
      "capacity": 4
    }
  ]
}

------------------------------------------------------------
------------------------------------------------------------


Get all menu_items API call
http://localhost:3000/api/v1/menu_items
Request: GET
Header : APP_ACCESS_TOKEN => Password
example
{
  "ResponseCode": 200,
  "Count": 7,
  "menu_items": [
    {
      "id": 1,
      "name": "Tea",
      "created_at": "2017-03-19T20:15:27.225Z",
      "updated_at": "2017-03-19T21:13:42.772Z",
      "item_image_file_name": "tea.jpg",
      "item_image_content_type": "image/jpeg",
      "item_image_file_size": 3998,
      "item_image_updated_at": "2017-03-19T21:13:42.272Z",
      "available": true,
      "category": "Drinks",
      "price": 2
    }
  ]
}

--------------------------------------------------------------
--------------------------------------------------------------

Get all orders API call
http://localhost:3000/api/v1/orders
Request: GET
Header : APP_ACCESS_TOKEN => Password
example
{
  "ResponseCode": 200,
  "Count": 15,
  "orders": [
    {
      "id": 1,
      "order_state": "Settled",
      "dine_table_id": 5,
      "created_at": "2017-02-27T20:15:29.832Z",
      "updated_at": "2017-03-19T20:15:29.834Z",
      "category": "Food",
      "waiter_id": 6,
      "total_price": null
    }
  ]
 }


