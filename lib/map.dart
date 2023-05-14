import 'night_canteen.dart';

List<Menu> items = [
  Menu(name: 'Bread Omelete', price: 45),
  Menu(name: 'Plain Omelete', price: 35),
  Menu(name: 'Onion Omelete', price: 40),
  Menu(name: 'Boiled Egg', price: 10),
  Menu(name: 'Paneer Tikka', price: 125),
  Menu(name: 'Chicken Tikka', price: 130),
  Menu(name: 'Tandoori Chicken Quarter', price: 115),
  Menu(name: 'Tandoori Chicken Half', price: 225),
  Menu(name: 'Tandoori Chicken Full', price: 450),
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
  Menu(name: 'Egg Dosa', price: 60)
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
      "Veg Paratha",
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
      "Halwa"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Uthappam",
      "Sambhar",
      "Karachutany",
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
      "Palak Koottu Sabji",
      "Rasam",
      "Curd Rice",
      "Payasam/Boondi"
    ],
    "Snacks": ["Pani Poori", "Tea, Coffee, Milk"],
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
    "Snacks": ["Sweet Corn Salad", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Green Peas Masala",
      "Egg Bhurji",
      "Rice",
      "Dal Fry",
      "Rasam",
      "Pickle"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Bhatura",
      "Chole Masala",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Raitha",
      "Veg Biryani",
      "Roti",
      "Palak Dal",
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
      "Chettandu Chicken",
      "Kadhai Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Saturday": {
    "Breakfast": [
      "Pav Bhaji",
      "Uppma",
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
      "Baingan Bharta",
      "Rice",
      "Vegetable Sambhar",
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
      "Tinda Aloo Sabji/Aloo Pattha Gobi",
      "Dal Makhani",
      "Rasam",
      "Gulab Jamun/Bondi"
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
    "Snacks": ["Chivda", "Chutney", "Tea, Coffee, Milk"],
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
      "Pav & Vemicelli Upma",
      "Bhaji/Coconut Chutni",
      "Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Boiled Egg, Sprouts"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Allo Meal Maker",
      "Plain Rice",
      "Dal Tadka",
      "Sambar",
      "Rasam",
      "Carrot Beans Poriyal",
      "Curd"
    ],
    "Snacks": ["Bhel Puri/Chana Sundal", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Kuska",
      "Channa Masala",
      "Masala Dal",
      "Rasam",
      "Pickle",
      "Varieties of Juice"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Uthappam",
      "Sambhar, Chutney",
      "Fruit Salad",
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
    "Snacks": ["Pani Poori", "Tea, Coffee, Milk"],
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
      "Fruit Salad",
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
    "Snacks": ["Sweet Corn Salad", "Chutney", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Green Peas Masala",
      "Egg Gravy",
      "Rice",
      "Dal Fry",
      "Rasam",
      "Pickle"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Poori/Bhatura",
      "Aloo Sabji/Chole",
      "Fruit Salad",
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
      "Fryums",
      "Raita"
    ],
    "Snacks": ["Cake/Patties/Channa", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapathi",
      "Fried Rice",
      "Dal Tadka",
      "Chettandu Chicken",
      "Kadhai Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Saturday": {
    "Breakfast": [
      "Varieties of Paratha",
      "Sabji",
      "Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk",
      "Boiled Egg, Sprouts"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Chana Dal",
      "Khichdi/Imu Bhat, Rice",
      "Seasonal Veg",
      "Sambhar",
      "Raw Banana Poriyal",
      "Rasam",
      "Butter Milk"
    ],
    "Snacks": ["Onion Bhajji", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapati",
      "Rice",
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
      "Fruit Salad",
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
      "Varieties of Juice"
    ],
    "Snacks": ["Dhokla/Pasta", "Tea, Coffee, Milk"],
    "Dinner": [
      "Chapathi",
      "Rice",
      "Tinda Aloo Sabji/Aloo Pattha Gobi",
      "Dal Makhani",
      "Rasam",
      "Varieties of Sweet"
    ],
  },
};

const Map<String, Map<String, List<String>>> mess_3 = {
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
      "Rajma Rassila",
      "Jeera Rice",
      "Aloo 65",
      "Rice",
      "Sambar",
      "Butter Milk",
      "Rasam"
    ],
    "Snacks": ["Vada Pav", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rajasthan Bindi",
      "Egg Curry",
      "Plain Dal",
      "Rice",
      "Rasam",
      "Pickle"
    ],
  },
  "Tuesday": {
    "Breakfast": [
      "Poha, Uppuma",
      "Jalebi",
      "Banava/Fruit Salad",
      "Chutney",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Mix Veg Dry",
      "Plain Rice",
      "Masoor Dal",
      "Sambar Rasam",
      "Mix Veg Dry",
      "Curd",
    ],
    "Snacks": ["Pani Poori", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Jeera Rice",
      "Choley",
      "Plain Dal",
      "Rasam",
      "Pickle",
      "Kheer"
    ],
  },
  "Wednesday": {
    "Breakfast": [
      "Pav",
      "Bhaji",
      "Idli, Red Chutney",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Jeera Rice",
      "Rice",
      "Dal Tadka",
      "Sambar Rasam",
      "Veg Kofta",
      "Butter Milk",
    ],
    "Snacks": ["Dabeli", "Tea, Coffee, Milk"],
    "Dinner": [
      "Dal Tadka",
      "Roti",
      "Rice",
      "Plain Dal",
      "Chicken 65",
      "Panner Bhurji",
      "Rasam",
      "Pickle"
    ],
  },
  "Thursday": {
    "Breakfast": [
      "Pongal",
      "Vada, Sambar, Chutney",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Ghee Rice",
      "Mixed Dal",
      "Aloo Dum",
      "Plain Rice",
      "Pumpkin More Kuzhambu",
      "Potato Poriyal",
      "Rasam",
      "Pickle",
      "Curd",
    ],
    "Snacks": ["Chowmin", "Tea, Coffee, Milk"],
    "Dinner": [
      "Sweet Corn Soup",
      "Roti",
      "Aloo Gobi",
      "Egg Bhurji",
      "Rice",
      "Plain Dal",
      "Rasam",
      "Pickle"
    ],
  },
  "Friday": {
    "Breakfast": [
      "Bhature",
      "Chole",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Kashmiri Pulao",
      "Roti",
      "Peas Masala",
      "Plain Rice",
      "Dal Fry",
      "Rasam",
      "Curd",
    ],
    "Snacks": ["Papadi Chat", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Plain Dal",
      "Butter Chicken",
      "Chilly Paneer",
      "Rasam",
      "Pickle"
    ],
  },
  "Saturday": {
    "Breakfast": [
      "Masala Dosa",
      "Sambar, Chutney",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Salad",
      "Roti",
      "Masoor Dal",
      "Kaju Rice",
      "Kadhai Chole",
      "Rasam",
      "Kara Kuzhambu",
      "Beetroot Poriyal",
      "Curd"
    ],
    "Snacks": ["Onion Pakoda", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Fried Rice",
      "Dal Tadka",
      "Veg Manchurian",
      "Rice",
      "Rasam",
    ],
  },
  "Sunday": {
    "Breakfast": [
      "Paneer Paratha",
      "Pickle/Curd",
      "Banana/Fruit Salad",
      "Bread",
      "Butter/Jam",
      "Tea, Coffee, Milk"
    ],
    "Lunch": [
      "Boondi Raita",
      "Roti",
      "Chicken Biryani",
      "Veg Briyani/Paneer",
      "Dal Kolhapur",
      "Mint Lemon Juice"
    ],
    "Snacks": ["Samosa", "Sauce", "Tea, Coffee, Milk"],
    "Dinner": [
      "Roti",
      "Rice",
      "Kadi Pakoda",
      "Dal Tadka",
      "Rasam",
      "Gulab Jamun"
    ],
  },
};
