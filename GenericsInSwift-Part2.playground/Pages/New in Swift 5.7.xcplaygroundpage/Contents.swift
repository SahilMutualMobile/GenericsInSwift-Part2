//: [Previous](@previous)

import Foundation

enum Topping: String {
    case Onion, Capsicum, Corn, Cheese
}
protocol PizzaTopping {
    var toppings: [Topping] { get }
}
protocol PizzaName {
    var name: String { get }
}
enum Pizzas: PizzaTopping {
    case Margherita, Farmhouse
    
    var toppings: [Topping] {
        switch self {
        case .Margherita :
            return [.Cheese]
        case .Farmhouse:
            return [.Corn, .Onion, .Capsicum, .Cheese]
        }
    }
}

protocol OrderItems {
    associatedtype aType: Comparable
    var name: String { get }
}
enum PizzaOrder: OrderItems {
    typealias aType = String
    
    case Margherita, Farmhouse
    var name : aType {
        "\(self)"
    }
}
enum DrinkOrder: OrderItems {
    typealias aType = String
    case Lemonade, Soda
    var name : aType {
        "\(self)"
    }
}

class PizzaShop {
    //New in Swift 5.7
    func orderItem(type: some OrderItems){
        print("\(type.name) is ready!")
    }
    //New in Swift 5.7
    func customMealOrder(orders: [any OrderItems]) {
        for order in orders {
            print("\(order.name) is ready!")
        }
    }
}

//Usag
var myOrder = PizzaShop()
myOrder.orderItem(type: PizzaOrder.Margherita)
var myOrder2 = PizzaShop()
myOrder2.orderItem(type: DrinkOrder.Soda)
var myOrder3 = PizzaShop()
myOrder3.customMealOrder(orders: [PizzaOrder.Margherita, DrinkOrder.Lemonade])


//: [Next](@next)
