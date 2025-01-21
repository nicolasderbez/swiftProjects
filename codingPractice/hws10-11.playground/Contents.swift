import Cocoa

//how to create structs

struct Album{ //Standard swift is defining Structs starting with capital
    let title: String
    let artist: String
    let year: Int
    
    func printSummary(){
        print("\(title) by \(artist) released in \(year)")
    }
}

let uvst = Album(title: "un verano sin ti", artist: "bad bunny", year: 2022)

let madvillainy = Album(title: "madvillainy", artist: "mf doom", year: 2004)

print(madvillainy.artist)

uvst.printSummary()

struct Employee{
    let name: String
    var vacationDays: Int = 14 //default value, removes obligation to call it in initializer
    
    mutating func takeVacation(days: Int){ //'mutating' to make clear that this changes values
        if vacationDays > days{
            vacationDays -= days
            print("vacation granted")
            print("days remaining: \(vacationDays)")
        }else{
            print("you don't have enough days.")
        }
    }
}


//to call mutating function, must use "var" and not "let" to make it mutable too.
var kaladin = Employee(name: "kaladin", vacationDays: 5) //"initializer"
kaladin.takeVacation(days: 3)
print(kaladin.vacationDays)

//swift actually treats initializer as function call using function "init"

let Adolin = Employee(name: "Adolin Kholin")
let Dalinar = Employee(name: "Dalinar Kholin", vacationDays: 0)

//how to compute property values dynamically

struct Employee2{
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    //variable directly calculated to prevent info loss
    var vacationRemaining: Int {
       
        //code that reads:
        get{
            vacationAllocated - vacationTaken
        }
        //code that writes:
        set{
            vacationAllocated = vacationTaken + newValue
        }
    }
    
}

var shallan = Employee2(name: "shallan", vacationAllocated: 14)

shallan.vacationTaken += 2
shallan.vacationRemaining = 5
print(shallan.vacationAllocated)

//how to take action when property changes

struct Gametest{
    var score = 0
}

var gametest = Gametest()
gametest.score += 10
print("score is now \(gametest.score)")
gametest.score += 12
//doesn't automatically print! we can fix that

struct Game {
    var score = 0 { //don't forget opening braces to make closure in constant
        didSet { //executed when this variable has changed
            print("score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score += 12
game.score += 5

struct App{
    var contacts = [String](){
        willSet{//"when this variable is about to change"
            print("current value is \(contacts)")
            print("new vallue will be \(newValue)") //newValue is internal use variable automatically provided by willSet
        }
        
        didSet{
            print("there are now \(contacts.count) contacts")
            print("old value was: \(oldValue)") //oldValue is automatically provided
        }
    }
}

var app = App()
app.contacts.append("shallan")
app.contacts.append("dalinar")
app.contacts.append("kaladin")

//how to create custom initializers

//initializer: special functions inside structs that give initial values to variables in structs

struct Player{
    let name: String
    let number: Int
    
    //only specify which data type is obligatory to declare when calling the struct
    init(name: String){ //no "func" keyword
        self.name = name //self refers to the Struct
        number = Int.random(in: 1...99)
        //no specific return type
    }
}

let player = Player(name: "megan R")
print(player.number)

//------------------------------------
//|          structs pt2             |
//------------------------------------

//how to limit access to internal data using access control


struct BankAccount {
    private(set) var funds = 0
    //private prevents value to be read or written from outside the struct, so that the value can only be calculated from the inside. prevents things such as account.funds = 10000000 without deposit
    
    mutating func deposit(amount: Int){
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount{
            funds-=amount
            return true
        } else{
            return false
        }
    }
}

var account = BankAccount()

let success = account.withdraw(amount: 200)

if success{
    print("Withdrawal successful")
} else{
    print("Withdrawal failed")
}

//private : don't let anything outside struct use this
//fileprivate: don't let anything outside current file use this
//public: let anyone use this
//private(set) let anyone read, but only let internal method modify it.


//statir properties and methods

struct School {
    static var studentCount = 0
    
    static func add(student: String){ //no need for "mutating" since it's struct, not constant/variable
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "nicolas derbez")
print(School.studentCount)

//self = the current VALUE of struct
// Self = the current TYPE of struct

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "www.google.com"

}


struct Employee3{
    let username: String
    let password: String
    
    static let example = Employee3(username: "nderbez", password: "admin") //for examples, don't count towards data saved
}

// checkpoint 6

//create a struct for a car. include:
    //model
    //seats
    //current gear
//method to change gears up or down, don't allow invalid geards
//think about variables and access control

struct Car{
    let model: String
    let seats: Int = 5
    private(set) var currentGear: Int = 0{
        didSet{
            print("current gear: \(currentGear)")
        }
    }
    
    mutating func gearShift(gear: Int) -> Bool{
        let validGears = [-1, 0, 1, 2, 3, 4, 5]
        if validGears.contains(gear){
            currentGear = gear
            return true
        }else{
            print("invalid gear")
            return false
        }
    }
}

var marcherati = Car(model: "march")
print("current gear: \(marcherati.currentGear)")
marcherati.gearShift(gear: 2)




