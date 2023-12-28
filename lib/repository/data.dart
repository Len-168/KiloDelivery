class MainData {
  String? type;
  String? tabLabel;
  List<ProductDetile> productDetile;
  MainData({
    required this.type,
    required this.tabLabel,
    required this.productDetile,
  });
}

class ProductDetile {
  String? title;
  double? price;
  String? deliverInfo;
  String? Policy;
  String? image;

  ProductDetile(
      {required this.title,
      required this.price,
      required this.deliverInfo,
      required this.Policy,
      required this.image});
}

List<MainData> lstMainData = [
  MainData(
    type: "Foods",
    tabLabel: "Foods",
    productDetile: [
      ProductDetile(
        title: "Elumichai sadam",
        price: 10.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/1.png",
      ),
      ProductDetile(
        title: "Chicken noodle soup",
        price: 13.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/2.png",
      ),
      ProductDetile(
        title: "Grilled Cheese",
        price: 9.8,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/3.png",
      ),
      ProductDetile(
        title: "Falafel",
        price: 25.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/4.png",
      ),
      ProductDetile(
        title: "Kebab",
        price: 12.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/5.png",
      ),
      ProductDetile(
        title: "Salad",
        price: 9.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/6.png",
      ),
      ProductDetile(
        title: "French toast",
        price: 1.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/7.png",
      ),
      ProductDetile(
        title: "Sausage",
        price: 5.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/8.png",
      ),
      ProductDetile(
        title: "Roast beef",
        price: 5.1,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/9.png",
      ),
      ProductDetile(
        title: "Chicken soup",
        price: 25,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/a.png",
      ),
      ProductDetile(
        title: "Sweet potato fries",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/b.png",
      ),
      ProductDetile(
        title: "Chocolate cake",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/c.png",
      ),
      ProductDetile(
        title: "Apple pie",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/d.png",
      ),
      ProductDetile(
        title: "Hot dogs",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/e.png",
      ),
      ProductDetile(
        title: "Elumichai sadam",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/f.png",
      ),
      ProductDetile(
        title: "Elumichai sadam",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/g.png",
      ),
      ProductDetile(
        title: "Elumichai sadam",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/h.png",
      ),
      ProductDetile(
        title: "Elumichai sadam",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/i.png",
      ),
      ProductDetile(
        title: "Elumichai sadam",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/j.png",
      ),
      ProductDetile(
        title: "Elumichai sadam",
        price: 150,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/food/k.png",
      ),
    ],
  ),
  MainData(
    type: "Pizza",
    tabLabel: "Pizza",
    productDetile: [
      ProductDetile(
        title: "Greek pizza",
        price: 10.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/1.png",
      ),
      ProductDetile(
        title: "Neapolitan pizza",
        price: 13.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/2.png",
      ),
      ProductDetile(
        title: "Supreme Pizza",
        price: 9.8,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/3.png",
      ),
      ProductDetile(
        title: "Margherita pizza",
        price: 25.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/4.png",
      ),
      ProductDetile(
        title: "Cheese pizza",
        price: 12.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/5.png",
      ),
      ProductDetile(
        title: "Calzone",
        price: 9.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/6.png",
      ),
      ProductDetile(
        title: "Detroit pizza",
        price: 1.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/7.png",
      ),
      ProductDetile(
        title: "Sausage",
        price: 5.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/8.png",
      ),
      ProductDetile(
        title: "Breakfast pizza",
        price: 5.1,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/9.png",
      ),
      ProductDetile(
        title: "BBQ Chicken Pizza",
        price: 25,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/pizza/10.png",
      ),
    ],
  ),
  MainData(
    type: "Snacks",
    tabLabel: "Snacks",
    productDetile: [
      ProductDetile(
        title: "Salted peanuts",
        price: 10.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/1.png",
      ),
      ProductDetile(
        title: "Pretzels",
        price: 13.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/2.png",
      ),
      ProductDetile(
        title: "Potato chips",
        price: 9.8,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/3.png",
      ),
      ProductDetile(
        title: "Banana Chips",
        price: 25.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/4.png",
      ),
      ProductDetile(
        title: "Apple chips",
        price: 12.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/5.png",
      ),
      ProductDetile(
        title: "Pork rinds",
        price: 9.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/6.png",
      ),
      ProductDetile(
        title: "Pretzels",
        price: 1.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/7.png",
      ),
      ProductDetile(
        title: "Cheese dips",
        price: 5.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/8.png",
      ),
      ProductDetile(
        title: "Mixed nuts",
        price: 5.1,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/9.png",
      ),
      ProductDetile(
        title: "Popcorn",
        price: 25,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/snacks/10.png",
      ),
    ],
  ),
  MainData(
    type: "Sauce",
    tabLabel: "Sauce",
    productDetile: [
      ProductDetile(
        title: "Salted peanuts",
        price: 10.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/1.png",
      ),
      ProductDetile(
        title: "Pretzels",
        price: 13.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/2.png",
      ),
      ProductDetile(
        title: "Potato chips",
        price: 9.8,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/3.png",
      ),
      ProductDetile(
        title: "Banana Chips",
        price: 25.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/4.png",
      ),
      ProductDetile(
        title: "Apple chips",
        price: 12.5,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/5.png",
      ),
      ProductDetile(
        title: "Pork rinds",
        price: 9.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/6.png",
      ),
      ProductDetile(
        title: "Pretzels",
        price: 1.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/7.png",
      ),
      ProductDetile(
        title: "Cheese dips",
        price: 5.0,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/8.png",
      ),
      ProductDetile(
        title: "Mixed nuts",
        price: 5.1,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/9.png",
      ),
      ProductDetile(
        title: "Popcorn",
        price: 25,
        deliverInfo:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order",
        Policy:
            "In business, delivery time is the elapsed time between the start of work on an order and the completion of work on that order Delivery time can be affected by many factors, such as the complexity of the product or service being produced, the availability of raw materials and inputs",
        image: "assets/image/sauce/10.png",
      ),
    ],
  ),
];
