// Playground - noun: a place where people can play


class Car
{
    var speed = 0.0
}

class ParentsCar : Car
{
    override var speed:Double {
    
        willSet {
            println("new value \(newValue)")
        }
        
        didSet {
            println("old value---\(oldValue)")
        }
    
    }
}

var car = ParentsCar()
car.speed = 10.0
