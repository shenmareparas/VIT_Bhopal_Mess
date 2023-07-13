import '/screens/underbelly.dart';
import '/screens/canteen.dart';

List<Menu> items = [
  Menu(name: 'Bread Omelette', price: 45),
  Menu(name: 'Plain Omelette', price: 35),
  Menu(name: 'Onion Omelette', price: 40),
  Menu(name: 'Boiled Egg', price: 10),
  Menu(name: 'Paneer Tikka', price: 125),
  Menu(name: 'Chicken Tikka', price: 130),
  Menu(name: 'Tandoori Chicken Full', price: 450),
  Menu(name: 'Tandoori Chicken Half', price: 225),
  Menu(name: 'Tandoori Chicken Quarter', price: 115),
  Menu(name: 'Chicken 65', price: 100),
  Menu(name: 'Chilly Chicken', price: 130),
  Menu(name: 'Butter Chicken Masala', price: 150),
  Menu(name: 'Kadai Chicken Masala', price: 140),
  Menu(name: 'Chicken Masala', price: 140),
  Menu(name: 'Chicken Tikka Masala', price: 140),
  Menu(name: 'Schezwan Chicken Noodles', price: 130),
  Menu(name: 'Schezwan Chicken Rice', price: 120),
  Menu(name: 'Chicken Fried Rice', price: 130),
  Menu(name: 'Egg Fried Rice', price: 120),
  Menu(name: 'Egg Noodles', price: 120),
  Menu(name: 'Chicken Noodles', price: 120),
  Menu(name: 'Plain Naan', price: 25),
  Menu(name: 'Garlic Naan', price: 35),
  Menu(name: 'Butter Naan', price: 30),
  Menu(name: 'Plain Roti', price: 20),
  Menu(name: 'Butter Roti', price: 30),
  Menu(name: 'Butter Paneer Masala', price: 140),
  Menu(name: 'Kadhai Paneer', price: 130),
  Menu(name: 'Chilly Paneer', price: 130),
  Menu(name: 'Veg Noodles', price: 110),
  Menu(name: 'Schezwan Veg Noodles', price: 120),
  Menu(name: 'Veg Fried Rice', price: 110),
  Menu(name: 'Schezwan Veg Fried Rice', price: 125),
  Menu(name: 'Plain Dosa', price: 50),
  Menu(name: 'Masala Dosa', price: 60),
  Menu(name: 'Onion Dosa', price: 55),
  Menu(name: 'Ghee Dosa', price: 60),
  Menu(name: 'Egg Dosa', price: 60),
  Menu(name: 'Milk 1L', price: 57)
];

List<MenuUB> itemsUB = [
  MenuUB(name: "Veg Plait", price: 45, category: "Bakery Items"),
  MenuUB(name: "Veg Sub Roll", price: 42, category: "Bakery Items"),
  MenuUB(name: "Veg Turnover", price: 45, category: "Bakery Items"),
  MenuUB(name: "Chilly Cheese Plait", price: 50, category: "Bakery Items"),
  MenuUB(name: "Paneer Pizza Burn", price: 50, category: "Bakery Items"),
  MenuUB(name: "Veg Crispy Roll", price: 50, category: "Bakery Items"),
  MenuUB(name: "Chicken Turnover", price: 50, category: "Bakery Items"),
  MenuUB(name: "Chicken Pizza Bun", price: 50, category: "Bakery Items"),
  MenuUB(name: "Chicken Sub Roll", price: 50, category: "Bakery Items"),
  MenuUB(name: "Chicken Plait", price: 53, category: "Bakery Items"),
  MenuUB(name: "Egg Turnover", price: 40, category: "Bakery Items"),
  MenuUB(name: "Veg Noodles", price: 130, category: "Chinese"),
  MenuUB(name: "Veg Fried Rice", price: 130, category: "Chinese"),
  MenuUB(name: "Chicken Noodles", price: 150, category: "Chinese"),
  MenuUB(name: "Chicken Fried Rice", price: 150, category: "Chinese"),
  MenuUB(name: "Chicken Biryani", price: 190, category: "Chinese"),
  MenuUB(name: "Jeera Rice", price: 130, category: "Chinese"),
  MenuUB(name: "Veg Biryani", price: 160, category: "Chinese"),
  MenuUB(name: "Veg Schezwan Noodles", price: 131, category: "Chinese"),
  MenuUB(name: "Schezwan Veg Fried Rice", price: 131, category: "Chinese"),
  MenuUB(name: "Schezwan Chicken Fried Rice", price: 152, category: "Chinese"),
  MenuUB(name: "Paneer Fried Rice", price: 160, category: "Chinese"),
  MenuUB(name: "Paneer Noodles", price: 160, category: "Chinese"),
  MenuUB(name: "Schezwan Chicken Noodles", price: 152, category: "Chinese"),
  MenuUB(name: "Egg Noodles", price: 142, category: "Chinese"),
  MenuUB(name: "Egg Fried Rice", price: 142, category: "Chinese"),
  MenuUB(name: 'Ginger Tea', price: 15, category: 'Hot'),
  MenuUB(name: 'Coffee', price: 15, category: 'Hot'),
  MenuUB(name: 'Hot Chocolate', price: 40, category: 'Hot'),
  MenuUB(name: 'Black Coffee', price: 30, category: 'Hot'),
  MenuUB(name: 'Ginger Tea', price: 10, category: 'Hot'),
  MenuUB(
      name: "Butterscotch Milkshake Small",
      price: 50,
      category: "Cold Beverages"),
  MenuUB(
      name: "Butterscotch Milkshake Large",
      price: 80,
      category: "Cold Beverages"),
  MenuUB(
      name: "Vanilla Milkshake Small", price: 50, category: "Cold Beverages"),
  MenuUB(
      name: "Vanilla Milkshake Large", price: 80, category: "Cold Beverages"),
  MenuUB(
      name: "Chocolate Milkshake Small", price: 50, category: "Cold Beverages"),
  MenuUB(
      name: "Chocolate Milkshake Large", price: 80, category: "Cold Beverages"),
  MenuUB(name: "Oreo Milkshake Small", price: 50, category: "Cold Beverages"),
  MenuUB(name: "Oreo Milkshake Large", price: 95, category: "Cold Beverages"),
  MenuUB(name: "Kitkat Milkshake Small", price: 60, category: "Cold Beverages"),
  MenuUB(name: "Kitkat Milkshake Large", price: 95, category: "Cold Beverages"),
  MenuUB(
      name: "Strawberry Milkshake Small",
      price: 42,
      category: "Cold Beverages"),
  MenuUB(
      name: "Strawberry Milkshake Large",
      price: 79,
      category: "Cold Beverages"),
  MenuUB(
      name: "Snickers Milkshake Small", price: 50, category: "Cold Beverages"),
  MenuUB(
      name: "Snickers Milkshake Large", price: 90, category: "Cold Beverages"),
  MenuUB(name: "Cold Coffee Small", price: 50, category: "Cold Beverages"),
  MenuUB(name: "Cold Coffee Large", price: 80, category: "Cold Beverages"),
  MenuUB(name: "Orange Juice", price: 70, category: "Fresh Juice"),
  MenuUB(name: "Sweet Lime Juice", price: 70, category: "Fresh Juice"),
  MenuUB(name: "Pineapple Juice", price: 70, category: "Fresh Juice"),
  MenuUB(name: "Mango Juice", price: 70, category: "Fresh Juice"),
  MenuUB(name: "Lemon Ice Tea Small", price: 42, category: "Fresh Juice"),
  MenuUB(name: "Lemon Ice Tea Large", price: 70, category: "Fresh Juice"),
  MenuUB(name: "Lime Mint Cooler Small", price: 42, category: "Fresh Juice"),
  MenuUB(name: "Lime Mint Cooler Large", price: 70, category: "Fresh Juice"),
  MenuUB(name: "Masala Dosa", price: 80, category: "South Indian"),
  MenuUB(name: "Butter Masala Dosa", price: 90, category: "South Indian"),
  MenuUB(name: "Plain Dosa", price: 70, category: "South Indian"),
  MenuUB(name: "Ghee Dosa", price: 79, category: "South Indian"),
  MenuUB(name: "Butter Dosa", price: 80, category: "South Indian"),
  MenuUB(name: "Podi Dosa", price: 80, category: "South Indian"),
  MenuUB(name: "Mushroom Kheema Dosa", price: 100, category: "South Indian"),
  MenuUB(name: "Paper Masala Dosa", price: 70, category: "South Indian"),
  MenuUB(name: "Paneer Kheema Dosa", price: 105, category: "South Indian"),
  MenuUB(name: "Cheese Masala Dosa", price: 100, category: "South Indian"),
  MenuUB(
      name: "Chilly Cheese Garlic Dosa", price: 130, category: "South Indian"),
  MenuUB(
      name: "Onion Cheese Garlic Dosa", price: 100, category: "South Indian"),
  MenuUB(
      name: "Chilly Garlic Paneer Dosa", price: 116, category: "South Indian"),
  MenuUB(name: "Ghee Sambar Idlies", price: 60, category: "South Indian"),
  MenuUB(name: "Double Cheese Sandwich", price: 89, category: "Sandwich"),
  MenuUB(name: "Double Cheese Sandwich + 🍟", price: 137, category: "Sandwich"),
  MenuUB(name: "Sweet Corn Sandwich", price: 89, category: "Sandwich"),
  MenuUB(name: "Sweet Corn Sandwich + 🍟", price: 126, category: "Sandwich"),
  MenuUB(name: "Paneer Tikka Sandwich", price: 100, category: "Sandwich"),
  MenuUB(name: "Paneer Tikka Sandwich + 🍟", price: 152, category: "Sandwich"),
  MenuUB(name: "Chicken Tikka Sandwich", price: 121, category: "Sandwich"),
  MenuUB(name: "Chicken Tikka Sandwich + 🍟", price: 163, category: "Sandwich"),
  MenuUB(name: "Mushroom Cheese Sandwich", price: 100, category: "Sandwich"),
  MenuUB(
      name: "Mushroom Cheese Sandwich + 🍟", price: 152, category: "Sandwich"),
  MenuUB(
      name: "Classic Chicken Club Sandwich", price: 121, category: "Sandwich"),
  MenuUB(
      name: "Classic Chicken Club Sandwich + 🍟",
      price: 152,
      category: "Sandwich"),
  MenuUB(
      name: "Cheese Mayo Grilled Chicken Sandwich",
      price: 110,
      category: "Sandwich"),
  MenuUB(
      name: "Cheese Mayo Grilled Chicken Sandwich + 🍟",
      price: 152,
      category: "Sandwich"),
  MenuUB(name: "Bombay Grilled Sandwich", price: 68, category: "Sandwich"),
  MenuUB(
      name: "Bombay Grilled Sandwich + 🍟", price: 137, category: "Sandwich"),
  MenuUB(name: "Veg Cheese Burger", price: 95, category: "Sandwich"),
  MenuUB(name: "Veg Cheese Burger + 🍟", price: 152, category: "Sandwich"),
  MenuUB(name: "Chicken Burger", price: 116, category: "Sandwich"),
  MenuUB(name: "Chicken Burger + 🍟", price: 163, category: "Sandwich"),
  MenuUB(name: "Veg Wrap", price: 95, category: "Sandwich"),
  MenuUB(name: "Veg Wrap + 🍟", price: 147, category: "Sandwich"),
  MenuUB(name: "Chicken Wrap", price: 121, category: "Sandwich"),
  MenuUB(name: "Chicken Wrap + 🍟", price: 158, category: "Sandwich"),
  MenuUB(name: "Paneer Wrap", price: 100, category: "Sandwich"),
  MenuUB(name: "Paneer Wrap + 🍟", price: 152, category: "Sandwich"),
  MenuUB(name: "Paneer Butter Masala", price: 158, category: "Indian Gravy"),
  MenuUB(name: "Kadai Butter Masala", price: 147, category: "Indian Gravy"),
  MenuUB(name: "Paneer Tikka Masala", price: 158, category: "Indian Gravy"),
  MenuUB(name: "Shahi Paneer Masala", price: 147, category: "Indian Gravy"),
  MenuUB(name: "Chicken Tikka Masala", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Schezwan Chicken Gravy", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Dal Makhani", price: 150, category: "Indian Gravy"),
  MenuUB(name: "Dal Tadka", price: 130, category: "Indian Gravy"),
  MenuUB(name: "Kadai Sabzi", price: 140, category: "Indian Gravy"),
  MenuUB(name: "Punjabi Chicken Masala", price: 168, category: "Indian Gravy"),
  MenuUB(
      name: "Hyderabadi Chicken Masala", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Butter Chicken Masala", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Chicken Lababdar", price: 168, category: "Indian Gravy"),
  MenuUB(
      name: "Dhanya Murga Adraki Masala", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Chicken Keema Masala", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Dahi Murga", price: 168, category: "Indian Gravy"),
  MenuUB(name: "Tandoori Roti", price: 30, category: "Tandoori Items"),
  MenuUB(name: "Tandoori Butter Roti", price: 35, category: "Tandoori Items"),
  MenuUB(name: "Tandoori Aloo Paratha", price: 55, category: "Tandoori Items"),
  MenuUB(
      name: "Tandoori Lachha Paratha", price: 47, category: "Tandoori Items"),
  MenuUB(name: "Naan", price: 37, category: "Tandoori Items"),
  MenuUB(name: "Butter Naan", price: 42, category: "Tandoori Items"),
  MenuUB(name: "Garlic Naan", price: 45, category: "Tandoori Items"),
  MenuUB(name: "Classic French Fries 🍟", price: 95, category: "Veg Starters"),
  MenuUB(name: "Masala French Fries 🍟", price: 105, category: "Veg Starters"),
  MenuUB(name: "Veg Cheese Fingers", price: 115, category: "Veg Starters"),
  MenuUB(name: "Paneer Tikka", price: 158, category: "Veg Starters"),
  MenuUB(name: "Paneer Malai Tikka", price: 158, category: "Veg Starters"),
  MenuUB(name: "Chilly Paneer Dry", price: 130, category: "Veg Starters"),
  MenuUB(name: "Chilly Paneer Gravy", price: 131, category: "Veg Starters"),
  MenuUB(name: "Veg Manchurian", price: 137, category: "Veg Starters"),
  MenuUB(name: "Mushroom Chilly", price: 137, category: "Veg Starters"),
  MenuUB(name: "Paneer 65", price: 140, category: "Veg Starters"),
  MenuUB(name: "Mushroom 65", price: 140, category: "Veg Starters"),
  MenuUB(name: "Honey Chilly Potato", price: 140, category: "Veg Starters"),
  MenuUB(name: "Chicken Nuggets", price: 152, category: "Non Veg Starters"),
  MenuUB(name: "Chicken Wings", price: 152, category: "Non Veg Starters"),
  MenuUB(name: "Chicken Tikka", price: 168, category: "Non Veg Starters"),
  MenuUB(name: "Chicken Malai Kebab", price: 163, category: "Non Veg Starters"),
  MenuUB(
      name: "Tandoori Chicken Half", price: 210, category: "Non Veg Starters"),
  MenuUB(
      name: "Tandoori Chicken Full", price: 399, category: "Non Veg Starters"),
  MenuUB(name: "Chilly Chicken Dry", price: 140, category: "Non Veg Starters"),
  MenuUB(
      name: "Chilly Chicken Gravy", price: 150, category: "Non Veg Starters"),
  MenuUB(name: "Dragon Chicken", price: 152, category: "Non Veg Starters"),
  MenuUB(name: "Chicken 65", price: 152, category: "Non Veg Starters"),
  MenuUB(name: "Bread Omelette", price: 63, category: "Egg Varieties"),
  MenuUB(name: "Masala Omelette", price: 37, category: "Egg Varieties"),
  MenuUB(name: "Cheese Omelette", price: 53, category: "Egg Varieties"),
  MenuUB(name: "Egg Bhurji", price: 37, category: "Egg Varieties"),
  MenuUB(name: "Veg Momos", price: 110, category: "Momos"),
  MenuUB(name: "Paneer Momos", price: 130, category: "Momos"),
  MenuUB(name: "Chicken Momos", price: 140, category: "Momos"),
  MenuUB(name: "Veg Mixed Nachos", price: 100, category: "Nachos"),
  MenuUB(name: "Chicken Mixed Nachos", price: 120, category: "Nachos"),
  MenuUB(name: "Penne Alfredo Pasta Small", price: 105, category: "Veg Pasta"),
  MenuUB(name: "Penne Alfredo Pasta Large", price: 168, category: "Veg Pasta"),
  MenuUB(name: "Penne Arablata Small", price: 105, category: "Veg Pasta"),
  MenuUB(name: "Penne Arablata Large", price: 168, category: "Veg Pasta"),
  MenuUB(name: "Pink Sauce Pasta Small", price: 105, category: "Veg Pasta"),
  MenuUB(name: "Pink Sauce Pasta Large", price: 168, category: "Veg Pasta"),
  MenuUB(name: "Basil Sauce Pasta Small", price: 105, category: "Veg Pasta"),
  MenuUB(name: "Basil Sauce Pasta Large", price: 168, category: "Veg Pasta"),
  MenuUB(
      name: "Penne Alfredo Chicken Pasta Small",
      price: 127,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Penne Alfredo Chicken Pasta Large",
      price: 179,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Penne Arablata Chicken Pasta Small",
      price: 127,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Penne Arablata Chicken Pasta Large",
      price: 179,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Pink Sauce Chicken Pasta Small",
      price: 127,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Pink Sauce Chicken Pasta Large",
      price: 179,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Basil Sauce Chicken Pasta Small",
      price: 127,
      category: "Non Veg Pasta"),
  MenuUB(
      name: "Basil Sauce Chicken Pasta Large",
      price: 179,
      category: "Non Veg Pasta"),
  MenuUB(name: "Oreo Pastry", price: 80, category: "Pastry"),
  MenuUB(name: "Kitkat Pastry", price: 80, category: "Pastry"),
  MenuUB(name: "Choco Truffle", price: 80, category: "Pastry"),
  MenuUB(name: "Blue Berry", price: 80, category: "Pastry"),
  MenuUB(name: "Swiss Roll", price: 74, category: "Pastry"),
  MenuUB(name: "Walnut Brownle", price: 74, category: "Pastry"),
  MenuUB(name: "Choco Doughnut", price: 42, category: "Pastry"),
  MenuUB(name: "Choco Truffle 500gm", price: 550, category: "Birthday Cake"),
  MenuUB(name: "Choco Truffle 1kg", price: 1000, category: "Birthday Cake"),
  MenuUB(name: "Kitkat Cake 500gm", price: 600, category: "Birthday Cake"),
  MenuUB(name: "Kitkat Cake 1kg", price: 1050, category: "Birthday Cake"),
  MenuUB(name: "Oreo Cake 500gm", price: 600, category: "Birthday Cake"),
  MenuUB(name: "Oreo Cake 1kg", price: 1050, category: "Birthday Cake"),
  MenuUB(name: "Chocolate Cake 500gm", price: 500, category: "Birthday Cake"),
  MenuUB(name: "Chocolate Cake 1kg", price: 900, category: "Birthday Cake"),
  MenuUB(
      name: "Butterscotch Cake 500gm", price: 500, category: "Birthday Cake"),
  MenuUB(name: "Butterscotch Cake 1kg", price: 880, category: "Birthday Cake"),
];

// Boys Hostel 1 CRCL Mess
const Map<String, Map<String, List<String>>> mess_1 = {
  "Monday": {
    "Breakfast": [
      "Idly, Medu Vada",
      "Sambar",
      "Red Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Rajma Gharwala",
      "Jeera Rice/Lemon Rice",
      "Aloo Pepper Fry",
      "Rice",
      "Koottu",
      "Rasam",
      "Juice"
    ],
    "Snacks": ["Dal Vada/Onion Kachori", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Kadi Pakoda",
      "Egg Bhurji Masala",
      "Dal Fry",
      "Rice",
      "Rasam",
      "Pickle"
    ],
  },
  "Tuesday": {
    "Breakfast": [
      "Veg Paratha/Poori",
      "Sabji",
      "Banava",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Boiled Egg, Sprouts"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Chana Masala",
      "Kaju Rice",
      "Dal Tadka",
      "Sambar",
      "Rasam",
      "Veg Poriyal",
      "Curd"
    ],
    "Snacks": ["Bhel Puri", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Chana Masala",
      "Kuska",
      "Veg 65",
      "Masala Dal",
      "Rasam",
      "Fruit Custard"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Uttapam",
      "Sambar, Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Kadai Veg",
      "Rice",
      "Mix Dal",
      "Drumstick Poriyal",
      "Rasam",
      "Curd Rice",
      "Payasam"
    ],
    "Snacks": ["Pani Puri/Onion Palak Vada", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Plain Dal",
      "Mughlai Chicken",
      "Mughlai Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Thursday": {
    "Breakfast": [
      "Poha, Pongal",
      "Jalebi",
      "Banana",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Veg Kofta",
      "Tomato Dal (Andhara Style)",
      "Veg Pulao",
      "Plain Rice",
      "Drumstick, Brinjal Poriyal",
      "Rasam",
      "Butter Milk"
    ],
    "Snacks": ["Noodles", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Aloo Matar Masala",
      "Egg Masala",
      "Rice",
      "Dal Fry",
      "Rasam",
      "Pickle"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Pav Bhaji/Upma",
      "Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Fryums",
      "Veg Biryani",
      "Roti",
      "Dalcha",
      "Plain Rice",
      "Raw Banana Poriyal",
      "Rasam",
      "Raita"
    ],
    "Snacks": ["Cake/Patties", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Dal Tadka",
      "Butter Chicken",
      "Kadai Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Saturday": {
    "Breakfast": [
      "Bhatura",
      "Chole",
      "Banana",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Boiled Egg, Sprouts"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Chana Dal",
      "Khichdi/Imu Bhat",
      "Aloo Shimla Mirchi",
      "Rice",
      "Sambar",
      "Soyabean Masala",
      "Rasam",
      "Butter Milk"
    ],
    "Snacks": ["Samosa/Mirchi Vada", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapati",
      "Fried Rice",
      "Dal Fry",
      "Veg Manchurian Gravy",
      "Rice",
      "Rasam",
    ],
  },
  "Sunday": {
    "Breakfast": [
      "Masala Dosa",
      "Sambar, Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Onion Cucumber Raitha",
      "Roti",
      "Chicken Biryani",
      "Paneer Biryani",
      "Masala Dal",
      "Juice"
    ],
    "Snacks": ["Dhokla/Pasta", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapathi",
      "Rice",
      "Kashmiri Dum Aloo Sabji",
      "Dal Makhani",
      "Rasam",
      "Gulab Jamun"
    ],
  },
};

// Boys Hostel 2 & 3 Mayuri Mess
const Map<String, Map<String, List<String>>> mess_2 = {
  "Monday": {
    "Breakfast": [
      "Idly, Medu Vada",
      "Sambar, Red Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Rajma Gharwala",
      "Jeera Rice/Lemon Rice",
      "Jeera Aloo Fry",
      "Rice",
      "Koottu",
      "Rasam",
      "Varieties of Juice"
    ],
    "Snacks": ["Samosa/Dahi Vada", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Kashmiri Aloo",
      "Egg Bhurji Masala",
      "Dal Fry",
      "Rice",
      "Rasam",
      "Pickle"
    ],
  },
  "Tuesday": {
    "Breakfast": [
      "Varieties of Paratha",
      "Sabji",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Boiled Egg, Sprouts"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Aloo Meal Maker",
      "Plain Rice",
      "Dal Tadka",
      "Sambar",
      "Rasam",
      "Carrot Beans Poriyal",
      "Curd"
    ],
    "Snacks": ["Bhel Puri", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Poori",
      "Chana Masala",
      "Kuska",
      "Masala Dal",
      "Rasam",
      "Pickle",
      "Fruit Custard/Kheer"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Uttapam",
      "Sambar, Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Veg Hariyali",
      "Rice",
      "Mix Dal",
      "Palak Koottu",
      "Rasam",
      "Sweet Boondi",
      "Curd Rice"
    ],
    "Snacks": ["Pani Puri", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Plain Dal",
      "Kadai/Pepper Chicken",
      "Butter Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Thursday": {
    "Breakfast": [
      "Poha, Pongal",
      "Jalebi",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Veg Korma",
      "Tomato Dal",
      "Veg Pulao",
      "Plain Rice",
      "Drumstick, Brinjal Poriyal",
      "Rasam",
      "Butter Milk"
    ],
    "Snacks": ["Sweet Corn Salad/Chana Chana Sundal", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Green Peas Masala",
      "Egg Curry",
      "Rice",
      "Dal Fry",
      "Rasam",
      "Pickle"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Pav Bhaji/Vermicelli Upma/Lemon Rice",
      "Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Veg Biryani",
      "Roti",
      "Palak Dal",
      "Plain Rice",
      "Tomato Thokku",
      "Rasam",
      "Raita"
    ],
    "Snacks": ["Cake/Patties/Onion Bhaji", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Dal Tadka",
      "Kadai/Butter Chicken",
      "Kadai Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Saturday": {
    "Breakfast": [
      "Bhatura",
      "Chole",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Boiled Egg, Sprouts"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Chana Dal",
      "Khichdi/Imu Bhat/Rice",
      "Aloo Chokha",
      "Sambar",
      "Raw Banana Poriyal",
      "Rasam",
      "Curd"
    ],
    "Snacks": ["Chivda/Vada Pav", "Chutney", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapati",
      "Fried Rice/Noodles",
      "Dal Fry",
      "Gobi Manchurian Gravy",
      "Rice",
      "Rasam",
    ],
  },
  "Sunday": {
    "Breakfast": [
      "Masala Dosa",
      "Sambar, Chutney",
      "Fruit",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Onion Cucumber Raitha",
      "Roti",
      "Chicken Biryani",
      "Paneer Biryani",
      "Masala Dal",
      "Varieties of Juice",
      "Onion Lemon"
    ],
    "Snacks": ["Dhokla/Pasta", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapathi",
      "Rice",
      "Tinda Aloo Sabji/Aloo Pattha Gobi",
      "Dal Makhani",
      "Rasam",
      "Gulab Jamun"
    ],
  },
};

// Girls Hostel CRCL Mess
const Map<String, Map<String, List<String>>> mess_3 = {
  "Monday": {
    "Breakfast": [
      "Dosa",
      "Sambar, Chutney",
      "Fruits",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Jeera Rice",
      "Veg 65",
      "Rajma",
      "Sambar",
      "Butter Milk",
      "Rasam",
      "Fresh Juice"
    ],
    "Snacks": ["Dabeli/Biscuits", "Tea, Coffee, Milk"],
    "Dinner": [
      "Jeera Rice",
      "Roti",
      "Rajasthani Bhindi",
      "Plain Dal",
      "Rasam",
      "Egg Bhurji"
    ],
  },
  "Tuesday": {
    "Breakfast": [
      "Puri Sabji",
      "Fruits - Watermelon",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Pongal",
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Curd Rice",
      "Chola",
      "Dal Fry",
      "Sambar",
      "Rasam",
      "Curd",
      "Plain Rice",
      "Fresh Juice",
    ],
    "Snacks": ["Pani Puri", "Tea, Coffee, Milk"],
    "Dinner": [
      "Jeera Rice",
      "Roti",
      "Kadai Veg",
      "Dal Tadka",
      "Rasam",
      "Kheer"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Pav Bhaji",
      "Fruits",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Jeera Rice",
      "Aloo Cabbage",
      "Dal Tadka",
      "Sambar",
      "Rasam",
      "Butter Milk",
    ],
    "Snacks": ["Samosa/Kachori", "Tea, Coffee, Milk"],
    "Dinner": [
      "Rice",
      "Roti",
      "Dal Tadka",
      "Chicken 65",
      "Rasam",
      "Mughali Paneer"
    ],
  },
  "Thursday": {
    "Breakfast": [
      "Idli/Vada",
      "Sambar, Chutney",
      "Fruits",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Plain Rice",
      "Masoor Dal",
      "Aloo Gobi Dry",
      "Sambar/Rasam",
      "Raw Banana Vegetable",
      "Plain Rice",
      "Curd",
      "Fresh Juice"
    ],
    "Snacks": ["Chowmin/Onion Pakoda", "Tea, Coffee, Milk"],
    "Dinner": [
      "Rice",
      "Roti",
      "Peas Masala",
      "Egg Curry",
      "Plain Dal",
      "Rasam"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Poha Jalebi / Chole Bhature",
      "Fruits",
      "Bread",
      "Butter/Jam",
      "Rawa Upma/Chutney",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Potato Fry/Aloo Palak",
      "Kaju Rice",
      "Dal Tadka",
      "Plain Rice",
      "Rasam",
      "Curd",
      "Fresh Juice"
    ],
    "Snacks": ["Dahi Papdi Chat", "Tea, Coffee, Milk"],
    "Dinner": [
      "Rice",
      "Roti",
      "Chettinad Chicken",
      "Paneer Tikka Masala",
      "Plain Dal",
      "Rasam"
    ],
  },
  "Saturday": {
    "Breakfast": [
      "Uttapam",
      "Sambar, Chutney",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Fruit",
    ],
    "Lunch": [
      "Salad",
      "Kashmiri Pulao",
      "Gobi Corn Masala",
      "Roti",
      "Bengali Dal",
      "Beetroot Dry",
      "Plain Rice",
      "Rasam"
    ],
    "Snacks": ["Dhokla/Chana", "Tea, Coffee, Milk"],
    "Dinner": [
      "Jeera Rice",
      "Dal Makhani",
      "Roti",
      "Achari Aloo",
      "Rasam",
      "Soup",
      "Halwa",
      "Rice"
    ],
  },
  "Sunday": {
    "Breakfast": [
      "Aloo Gobi Paratha",
      "Pickles",
      "Fruits",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Curd"
    ],
    "Lunch": [
      "Salad",
      "Chicken Biriyani",
      "Raita",
      "Veg Biryani",
      "Dal Maharani",
      "Paneer",
      "Boondi Raita"
    ],
    "Snacks": ["Peanut/Spring Roll", "Tea, Coffee, Milk"],
    "Dinner": [
      "Ghee Rice",
      "Roti",
      "Baingan Bharta",
      "Dal Tadka",
      "Rasam",
      "Gulab Jamun"
    ],
  },
};
