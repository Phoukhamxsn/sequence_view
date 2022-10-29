select*from production.brands
select*from production.categories
select*from production.products
select*from production.stocks

select*from sales.customers
select*from sales.order_items
select*from sales.orders
select*from sales.staffs
select*from sales.stores



select category_id "ລຳດັບ", category_name "ປະເພດສິນຄ້າ" from production.categories;

select brand_id "ລຳດັບ", brand_Name "ຢີຫໍ້" from production.brands;

select product_id "ລະຫັດສິນຄ້າ",product_name"ຊື່",brand_id"ຢີຫໍ້" ,category_id"ລຳດັບ",model_year"ປີ",list_price"ລາຄາ" from production.products; 

select store_id "ລະຫັດຮ້ານຄ້າ",product_id"ລະຫັດສິນຄ້າ",quantity"ຈຳນວນ" from production.stocks;

select customer_id "ລະຫັດລູກຄ້າ",frist_name "ຊື່",last_name "ນາມສະກຸນ",phone "ເບີໂທ", email"ອີເມວ",street"ເຂດ",city "ເມືອງ",state "ແຂວງ",zip_code"ເລກທີບ້ານ" from sales.customers

select order_id "ລະຫັດບິນ",item_id "ເລກສິນຄ້າ",product_id "ລະຫັດສິນຄ້າ",quantity "ຈຳນວນ",list_price "ລາຄາ",discount"ສ່ວນລົດ" from sales.order_items

select order_id "ລະຫັດບິນ",customer_id "ລະຫັດລູກຄ້າ",order_status "ສະຖານະບິນ",order_date "ວັນທີອອກບິນ",required_date "ວັນທີ່ຢືນຢັນບິນ",shipped_date "ວັນທີຈັດສົ່ງ",store_id "ລະຫັດຮ້ານຄ້າ",staff_id"ລະຫັດພະນັກງານ" from sales.orders

select staff_id"ລະຫັດພະນັກງານ",first_name "ຊື່",last_name"ນາມສະກຸນ",email"ອີເມວ",phone"ເບີໂທ",active"ຄວາມກະຕືລືລົ້ນ",store_id"ລະຫັດຮ້ານຄ້າ",manager_id"ລະຫັດຜູ້ຈັດການ" from sales.staffs

select store_id"ລະຫັດຮ້ານຄ້າ",store_name"ຊື່ຮ້ານຄ້າ",phone"ເບີໂທ",email"ອີເມວ",street"ເຂດ",city"ເມືອງ",state"ແຂວງ",zip_code"ເລກທີບ້ານ" from sales.stores