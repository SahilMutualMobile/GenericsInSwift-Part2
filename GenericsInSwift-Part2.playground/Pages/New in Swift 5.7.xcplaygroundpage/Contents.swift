//: [Previous](@previous)

import Foundation

enum PizzaTopping: String {
    case onion = "Onion"
    case capsicum = "Capsicum"
    case corn = "Corn"
    case cheese = "Cheese"
    case lotsOfCheese = "Lots of cheese"
}

protocol RestaurantItem {
    associatedtype Message = String
    func acceptOrderItem() -> Message
    func prepareOrderItem() -> Message
}

enum PizzaType: String, RestaurantItem {
    
    case margherita = "Margherita"
    case farmhouse = "Farmhouse"
    case goldenCorn = "Golden corn"
    
    var toppings: [PizzaTopping] {
        switch self {
        case .margherita:
            return [.lotsOfCheese]
        case .farmhouse:
            return [.corn, .capsicum, .onion, .cheese]
        case .goldenCorn:
            return [.corn, .cheese]
        }
    }
    func acceptOrderItem() -> String {
        "\(self.rawValue) pizza in preparation"
    }
    func prepareOrderItem() -> String {
        "\(self.rawValue) pizza is ready!"
    }
}

enum SideDishType: String, RestaurantItem {
    
    case fries = "Fries"
    case calzone = "Calzone"
    
    func acceptOrderItem() -> String {
        "\(self.rawValue) side dish in preparation"
    }
    func prepareOrderItem() -> String {
        "\(self.rawValue) side dish is ready!"
    }
}

enum DrinkType: String, RestaurantItem {
    
    case soda = "Soda"
    case lemonade = "Lemonade"
    
    func acceptOrderItem() -> String {
        "\(self.rawValue) drink in preparation"
    }
    func prepareOrderItem() -> String {
        "\(self.rawValue) drink is ready!"
    }
}

class PizzaShop {
    
    var orderNumber: Int = 1
    //New in Swift 5.7
    func onePlusOneOffer(order: some RestaurantItem) {
        print("Order #\(orderNumber) starting")
        for _ in 0 ..< 2 {
            print(order.acceptOrderItem())
            print(order.prepareOrderItem())
        }
        print("Order #\(orderNumber) complete")
        orderNumber += 1
    }
    //New in Swift 5.7
    func mealOrder(order: [any RestaurantItem]) {
        print("Order #\(orderNumber) starting")
        for item in order {
            //New in Swift 5.7
            print(item.acceptOrderItem())
            print(item.prepareOrderItem())
        }
        print("Order #\(orderNumber) complete")
        orderNumber += 1
    }
}

//Usage
//New in Swift 5.7
let happyMeal1: [any RestaurantItem] =
[PizzaType.margherita, SideDishType.fries, DrinkType.lemonade]
let happyMeal2: [any RestaurantItem] =
[PizzaType.farmhouse, SideDishType.calzone, DrinkType.soda]

let pizzaShop = PizzaShop()
pizzaShop.mealOrder(order: happyMeal1)
pizzaShop.mealOrder(order: happyMeal2)
pizzaShop.mealOrder(order: [SideDishType.calzone, DrinkType.lemonade])
pizzaShop.onePlusOneOffer(order: PizzaType.goldenCorn)
pizzaShop.onePlusOneOffer(order: DrinkType.lemonade)

//: [Next](@next)
