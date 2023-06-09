import '/screens/canteen.dart';

List<Menu> items = [
  Menu(name: 'Bread Omelette', price: 45, quantity: 0),
  Menu(name: 'Plain Omelette', price: 35, quantity: 0),
  Menu(name: 'Onion Omelette', price: 40, quantity: 0),
  Menu(name: 'Boiled Egg', price: 10, quantity: 0),
  Menu(name: 'Paneer Tikka', price: 125, quantity: 0),
  Menu(name: 'Chicken Tikka', price: 130, quantity: 0),
  Menu(name: 'Tandoori Chicken Full', price: 450, quantity: 0),
  Menu(name: 'Tandoori Chicken Half', price: 225, quantity: 0),
  Menu(name: 'Tandoori Chicken Quarter', price: 115, quantity: 0),
  Menu(name: 'Chicken 65', price: 100, quantity: 0),
  Menu(name: 'Chilly Chicken', price: 130, quantity: 0),
  Menu(name: 'Butter Chicken Masala', price: 150, quantity: 0),
  Menu(name: 'Kadai Chicken Masala', price: 140, quantity: 0),
  Menu(name: 'Chicken Masala', price: 140, quantity: 0),
  Menu(name: 'Chicken Tikka Masala', price: 140, quantity: 0),
  Menu(name: 'Schezwan Chicken Noodles', price: 130, quantity: 0),
  Menu(name: 'Schezwan Chicken Rice', price: 120, quantity: 0),
  Menu(name: 'Chicken Fried Rice', price: 130, quantity: 0),
  Menu(name: 'Egg Fried Rice', price: 120, quantity: 0),
  Menu(name: 'Egg Noodles', price: 120, quantity: 0),
  Menu(name: 'Chicken Noodles', price: 120, quantity: 0),
  Menu(name: 'Plain Naan', price: 25, quantity: 0),
  Menu(name: 'Garlic Naan', price: 35, quantity: 0),
  Menu(name: 'Butter Naan', price: 30, quantity: 0),
  Menu(name: 'Plain Roti', price: 20, quantity: 0),
  Menu(name: 'Butter Roti', price: 30, quantity: 0),
  Menu(name: 'Butter Paneer Masala', price: 140, quantity: 0),
  Menu(name: 'Kadhai Paneer', price: 130, quantity: 0),
  Menu(name: 'Chilly Paneer', price: 130, quantity: 0),
  Menu(name: 'Veg Noodles', price: 110, quantity: 0),
  Menu(name: 'Schezwan Veg Noodles', price: 120, quantity: 0),
  Menu(name: 'Veg Fried Rice', price: 110, quantity: 0),
  Menu(name: 'Schezwan Veg Fried Rice', price: 125, quantity: 0),
  Menu(name: 'Plain Dosa', price: 50, quantity: 0),
  Menu(name: 'Masala Dosa', price: 60, quantity: 0),
  Menu(name: 'Onion Dosa', price: 55, quantity: 0),
  Menu(name: 'Ghee Dosa', price: 60, quantity: 0),
  Menu(name: 'Egg Dosa', price: 60, quantity: 0)
];

const Map<String, Map<String, List<String>>> mess_1 = {
  "Monday": {
    "Breakfast": [
      "Idly, Medu Vada",
      "Chutney, Sambar",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Rajma Gharwala",
      "Jeera Rice",
      "Aloo Pepper Fry",
      "Rice",
      "Lemon Rice",
      "Koottu",
      "Rasam",
      "Juice"
    ],
    "Snacks": ["Vada Pav", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Kashmiri Pulao",
      "Egg Bhurji Masala",
      "Plain Dal",
      "Rice",
      "Rasam",
      "Pickle"
    ],
  },
  "Tuesday": {
    "Breakfast": [
      "Veg Paratha/Poori",
      "Veg Sabji",
      "Banava/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Poori",
      "Chana Masala",
      "Plain Rice",
      "Dal Tadka",
      "Sambar",
      "Rasam",
      "Carrot Beans Poriyal",
      "Curd"
    ],
    "Snacks": ["Bhel/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Kuska",
      "Aloo Meal Maker Sabji",
      "Masala Dal",
      "Rasam",
      "Pickle",
      "Halwa",
      "Fruit Custard"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Uttapam",
      "Sambar",
      "Kara Chutney",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Aloo Corn",
      "Rice",
      "Mix Dal",
      "Palak Koottu Sabji",
      "Rasam",
      "Curd Rice",
      "Payasam"
    ],
    "Snacks": ["Pani Puri", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Plain Dal",
      "Capsicum Onion Chicken",
      "Butter Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Thursday": {
    "Breakfast": [
      "Poha, Pongal",
      "Jalebi",
      "Banana/Fruit Salad",
      "Chutney",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Navratan Kurma",
      "Tomato Dal (Andhara Style)",
      "Veg Pulao",
      "Plain Rice",
      "Drumstick, Bagan, Poriyal",
      "Rasam",
      "Pickle",
      "Butter Milk"
    ],
    "Snacks": ["Sweet Corn Salad/Dahi Vada", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Green Peas Masala",
      "Egg Masala",
      "Rice",
      "Dal Fry",
      "Rasam",
      "Pickle"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Dosa",
      "Sambar",
      "Green Chutney",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Raitha",
      "Veg Biryani",
      "Roti",
      "Dalcha",
      "Plain Rice",
      "Tomato Thokku",
      "Rasam",
      "Fryums",
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
      "Chole Masala",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Chana Dal",
      "Kitchadi/Tamarind Rice",
      "Aloo Choka",
      "Rice",
      "Vegetable Sambar",
      "Raw Banana Poriyal",
      "Rasam",
      "Butter Milk"
    ],
    "Snacks": ["Samosa", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapati",
      "Fried Rice",
      "Dal Fry",
      "Gobi Manchurian",
      "Rice",
      "Rasam",
    ],
  },
  "Sunday": {
    "Breakfast": [
      "Masala Dosa",
      "Sambar, Chutney",
      "Banana/Fruit Salad",
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
      "Mint Lemon Juice"
    ],
    "Snacks": ["Dhokla/Pasta", "Green Chutney", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapathi",
      "Rice",
      "Tinda Aloo Sabji/Aloo Patta Gobi",
      "Dal Makhani",
      "Rasam",
      "Gulab Jamun"
    ],
  },
};

const Map<String, Map<String, List<String>>> mess_2 = {
  "Monday": {
    "Breakfast": [
      "Idly, Medu Vada",
      "Red Chutney, Sambar",
      "Fruit Salad",
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
    "Snacks": ["Chivda/Vada Pav", "Chutney", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Kashmiri Pulao",
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
    "Snacks": ["Sweet Corn Salad/Chana Dal Fry", "Tea, Coffee, Milk"],
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
    "Snacks": ["Samosa/Dahi Vada", "Tea, Coffee, Milk"],
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
      "Rasam",
      "Kheer",
      "Dal Tadka"
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
      "Aloo Cabbage Peas",
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
      "Pepper Chicken Dry",
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
      "Aloo Gobi Day",
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
      "Poha",
      "Jalebi",
      "Fruits",
      "Bread",
      "Butter/Jam",
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
      "Tea, Coffee, Milk"
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
    "Snacks": ["Peanut Pakoda/Spring Roll", "Tea, Coffee, Milk"],
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
