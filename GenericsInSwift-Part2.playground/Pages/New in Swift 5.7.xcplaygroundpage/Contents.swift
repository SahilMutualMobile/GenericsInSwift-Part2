//: [Previous](@previous)

import Foundation

enum PizzaTopping: String {
    case onion = "Onion"
    case capsicum = "Capsicum"
    case corn = "Corn"
    case cheese = "Cheese"
    case lotsOfCheese = "Lots of cheese"
}

protocol ItemName {
    associatedtype type: Comparable
    var message: String { get }
}

enum PizzaType: String, ItemName {
    typealias type = String
    
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
    var message: type {
        "\(self.rawValue) pizza is ready!"
    }
}

enum SideDishType: String, ItemName {
    
    typealias type = String
    
    case fries = "Fries"
    case calzone = "Calzone"
    var message: type {
        "\(self.rawValue) side dish is ready!"
    }
}

enum DrinkType: String, ItemName {
    typealias type = String
    case soda = "Soda"
    case lemonade = "Lemonade"
    var message: type {
        "\(self.rawValue) drink is ready!"
    }
}

class PizzaShop {
    //New in Swift 5.7
    //Protocol 'ItemName' can only be used as a generic constraint because it has Self or associated type requirements
    func mealOrder(orders: [any ItemName]) {
        for order in orders {
            print(order.message)
        }
    }
    //New in Swift 5.7
    //'some' types are only implemented for the declared type of properties and subscripts and the return type of functions
    func onePlusOneOffer(order: some ItemName) {
        for _ in 0 ..< 2 {
            print(order.message)
        }
    }
}
//New in Swift 5.7
//Protocol 'ItemName' can only be used as a generic constraint because it has Self or associated type requirements
let happyMeal1: [any ItemName] = [PizzaType.margherita, SideDishType.fries, DrinkType.lemonade]
let happyMeal2: [any ItemName] = [PizzaType.farmhouse, SideDishType.calzone, DrinkType.soda]

let pizzaOrder = PizzaShop()
pizzaOrder.mealOrder(orders: happyMeal1)

let specialOffer1 = PizzaShop()
specialOffer1.onePlusOneOffer(order: PizzaType.goldenCorn)

let specialOffer2 = PizzaShop()
specialOffer2.onePlusOneOffer(order: DrinkType.lemonade)

//: [Next](@next)
