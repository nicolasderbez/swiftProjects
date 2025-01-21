import Cocoa

//how to create classes

//difference from classes and scruct:
    //1.- you can make a class build upon functionality from another class (inheritance)
    // swift wont make initializers automatically
    // if you copy instance of class, both copies share the same data
    //can add deinitializers to run when the final copy is destroyed
    //constant class instances can have their properties changed

class Game { //could be either class or struct in this instance
    var score = 0{
        didSet{
            print("score is now \(score)")
        }
    }
}

var newGame = Game()

newGame.score += 10

//how to make one class inherit from another

//parent class:
class Employee {
    let hours: Int
    
    init(hours: Int) //initializer
    {
        self.hours = hours
    }
    func printSummary(){
        print("i work for \(hours) hours a day")
    }
}

//Child classes:

//if child classes want to change properties or methods from parent classes, it must use "override" function

class Developer: Employee { //class that inherits from employeee, inherits "hours" property
    func work(){
        print("im writing code for \(hours) hours")
    }
    override func printSummary() {
        print("im a developer who will sometimes work \(hours) hours a day, others playing balatro")
    }
    
}

final class Manager: Employee { //"final" class can inherit, but nothing can inherit aka cant have children
    func work() {
        print("im going to meetings for \(hours) hours")
    }
}

let nico = Developer(hours: 10)
let rodrigo = Manager(hours: 20)
let oscar = Developer(hours: 20)
rodrigo.work()
nico.work()
oscar.printSummary()

//-----------how to add initializers for classes---------

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool){
        self.isElectric = isElectric
    }
}

//if we want to add another property, we must specify initializers from superclass
//we can also give it a default value to inherit.
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool){
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) //assigns value of superclass
    }
}

let tesla = Car(isElectric: true, isConvertible: false)


//-----------how to copy classes-------------------

class User {
    var username = "Anonymus"
    
    //custom function to generate another instance
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
    
}

var user1 = User()
var user2 = user1

user2.username = "kaladin" //since it refers to the same instance of data, it will change both. In structs, changing the copy won't change the original.

print(user1.username)
print(user2.username)

//if we want to create a separate copy that doesn't refer to same instance of data, we must create custom function

var user3 = user1.copy()
user3.username = "dalinar"
print(user3.username)

//--------------how to create deinitializers--------------

//don't use func with deinitializers
//they don't take parameters or return data
//automatically called when last copy of class instace is deleted
//never call them directly
//structs don't have deinitializers, since they're always unique

//scope: local space/context, delimited by brackets{}

class User2 {
    let id: Int
    init(id: Int){
        self.id = id
        print("user \(id): im alive")
    }
    deinit {
      print("user \(id): im dead")
    }
}


var users = [User2]()

//if it's not stored in array, the data instance is deleted (since it's associated to temporary valuable), so it would call deinitializer whenever it exits the scope,
for i in 1...3{
    let user = User2(id:i)
    print("user: \(user.id): im in control ")
    users.append(user)
}

print("loop finished")
users.removeAll()
print("Array is clear")

//see the difference here:
for i in 1...3{
    let userdie = User2(id:i)
    print("user: \(userdie.id): im in control ")
}

//-----how to work with variables inside classes------

class User3 {
    var name = "paul"
}

var user = User3()
user.name = "taylor"
user = User3()
print(user.name)


//class can ve constant or variable ("signopost")
//values can be constant or variable (they can change their value or not)
//4 possible combinations

//summary:
    //differences between classes and structs:
        //classes can inherit
        //swift doesn't generate memberwise initializer for classes
        // copies of a class instance point to same instance (change one, they all change)
        //classes run deinitializers that run when last instance of data is destroyed
        // you can change variable properties inside constant class instances


//checkpoint 7
//make a class heriarchy for animals.
    //start with Animal, add legs property for number of legs an animal has.
        //make a dog subclass of Animal, giving it a speak() methid that prints a dog barking string but each subclass should print something different. (corgi/poodle)
    //make a cat an Animal subclass, ad a speak() method, wich each subclass printint something different, and isTame boolean property, set with initializer
        //make Persian and Lion subclasses of cat.

class Animal{
    let legs: Int
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal{
    func speak(){
        print("bark bark")
    }
}

class Cat: Animal{
    var isTame: Bool
    init(legs: Int, isTame: Bool){
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("meow")
    }
}

final class Corgi: Dog{
  
    
    override func speak() {
        print("i have a big butt")
    }
}

final class Poodle: Dog{
    override func speak(){
        print("i am very demure")
    }
}

final class Persian: Cat{
    override func speak(){
        print("i am very fluffy")
    }
    
}



let nich = Persian(legs:4, isTame: true)
nich.speak()

let chalupa = Corgi(legs:4)

chalupa.speak()







