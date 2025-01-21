import Cocoa


//-------------------------------------
//|      protocols and extensions     |
//-------------------------------------

//how to create and use protocols

protocol Vehicle{
    //no function bodies allowed:
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
    //variables that must conform with this protocol:
    var name: String { get } //read only
    var currentPassengers: Int{ get set } //read and write
}

protocol canBeElectric{
    
}
//struct conforming to protocols:
struct Car: Vehicle, canBeElectric {//'vehicle' is redundant
    let name = "Car"
    var currentPassengers: Int = 1 //must be 'var' since protocol declares readeble and writable
    
    func estimateTime(for distance: Int) -> Int{
        distance / 50
    }
    func travel(distance: Int){
        print("im traveling \(distance) km")
    }
    
    func openSunroof(){
        print("its a nice day")
    } //can have more funcs but must have the ones in protocol
}

struct bicycle: Vehicle{
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    let name = "bicycle"
    var currentPassengers = 1
    
    func travel(distance: Int){
        print("im cycling \(distance) km")
    }
}

func commute(distance: Int, using vehicle: Vehicle){
    if vehicle.estimateTime(for: distance) > 100{
        print("that's too slow")
    } else{
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int){
    for vehicle in vehicles{
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) km")
    }
}
let car = Car()
commute(distance: 100, using: car)

let bike = bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)


//how to use opaque return types

//how to make it to return a protocol that matches certain criteria? -> keyword 'some'

//since whatever we want to show in screen is a return type, we use:
protocol View {}
//with 'some' View, so that return type conforms to said protocol and we don't have to match it exactly each time.


//'equatable' = a specific type of data, kind of like a wldcard


func getRandomNumber() -> some Equatable{
    Double.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

//how to create and use extensions
var quote = "         strenght before weakness     "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//generate an extension to not have to do that every time

func trim2(_ string: String) -> String{
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed2 = trim2(quote)


//but, using extensions:

extension String{ //String is the type we're extending
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
   //if returning a NEW value, use past: 'ed'
    }
}

//extensions can ONLY have computed properties, since it's getting saved in the data type itself

let trimmed3 = quote.trimmed() //much easier!

//benefits:
    //easier to localize extension
    //naturally grouped by data type
    //they get full access to the types internal data, for example, it can mutate:

extension String{
    //if altering the original value, use present (trim)
    mutating func trim() { //
        self = self.trimmed()
    }
        
    //we are adding a new property to strings!
        var lines: [String]{
            self.components(separatedBy: .newlines)
            //how to calculate said property
        }
    }


quote.trim()
let lyrics = """
debi tirar mas fotos
de cuando
te tuve
debi darte mas besos
y abrazos
las veces que pude
"""

print(lyrics.lines.count)

struct Book{
    let title: String
    let pageCount: Int
    let readingHours: Int
    
}


    
extension Book{
    //if we create custom memberwise initializer, swift will deactivate the automatic one
    init(title: String, pageCount: Int){
        self.title = title //member-wise initializer
        self.pageCount = pageCount
        self.readingHours = pageCount / 50 //calculated initializer
    }
}



let twok =  Book(title: "The way of kings", pageCount: 1250, readingHours: 40)

//but if we create a custom memberwise initializer inside an extension, swift WONT disable the automatic one, we can have calculated and stored properties

//how to create and use protocol extensions

extension Collection { //all types of collections: sets, dictionaries and arrays and ANY tipes that conforms to 'collection'
    var isnotEmpty: Bool{
        isEmpty == false
    }
}


let guests = ["Mario", "Luigi", "Peach"]

if guests.isnotEmpty {
    print("guest count: \(guests.count)")
}



protocol Person{
    var name: String {get}
    func sayHello()
}

//add default implementation
extension Person{
    func sayHello(){
        print("hi, i'm \(name)")
    }
}


//even though is required, we added default implementation, so we needn't add it again
struct Employee: Person{
    let name: String
}

let kaladin = Employee(name: "kaladdin stormblessed")
kaladin.sayHello()

//summary: protocols and extensions
    //protocols are like contracts for code
    //opaque return types let us hide some information in the code, ie, have flexibility
    //extensions let us add functionality to existing types
    //protocol extensions let us add functionality to many types all at once

//---------checkpoint 8----------------
//make a protocol that describes a building
    //integer storing how many rooms
    //store cost as int
    //property storing the name of estate agent selling the building
    //add a method for printing sales summary
//create two structs, house and office, that conform to it.

protocol Building{
    var rooms: Int {get}
    var cost: Int {get}
    var salesman: String {get}
    func summary()
    
}

extension Building {
    func summary(){
        print("this building with \(rooms) rooms will cost you $\(cost), contact \(salesman) for more information.")
    }
}

struct House: Building{
    var rooms: Int
    var cost: Int
    var salesman: String
}

struct Office: Building{
    var rooms: Int
    var cost: Int
    var salesman: String
}

let samara = Office(rooms: 17, cost: 40000000, salesman: "funo")

let qbico = House(rooms: 2, cost: 4000000, salesman: "adriana")

samara.summary()
qbico.summary()
