import Cocoa

//how to handle missing data with optionals

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]

//let peachOpposite = opposites["Peach"] doesn't exist!
//nil -> optionals: data could be there or not



if let marioOpposite = opposites["Mario"]{
    print("Mario's opposite is \(marioOpposite)")
}
//reads the option, then, if it exists, it will assign to variable

var username: String? = nil
if let unwrappedName = username {
    print("we got a user: \(unwrappedName)")
} else {
    print("the optional was empty")
}


//these are both numbers, present, and non optional.
var num2 = 0
var str2 = ""
var arr2 = [Int]()

//could or could not be there
var num3: Int? = nil
var str3: String? = nil
var arr3: [Int]? = nil

func square(number: Int) -> Int{
    number * number
}

var number: Int? = nil //state of 'superposition'

//unwrap the number = 'collapse wavefunction': (if let)
if let number = number{ //shadowing: create a local variable that's only in the scope
    print(square(number: number))
} //needs to be defined in order to run function



//how to unwrap optionals with guard

func printSquare(of number: Int?){
    guard let number = number else{
        print("Missing input")
        return
    }
    print("\(number) squared is \(number * number)")
}

//if let runs if optional has value
//guard let runs if optional doesn't have a value
    //requires 'return' if guard check fails
//if optional you're unwrapping has value, you can use it after the guard finishes.

//how to unwrap optionals with nil coalescing
//nil coalescing: gives default option if optional was empty
let ceos = [
    "meta" : "zuck",
    "twitter" : "musk",
    "amazon" : "bezos"
]

//'??' is nil coalescing operator
let new = ceos["apple"] ?? "N/A"
//or:
//let new = ceos["apple", default: "N/A"]
//BUT nil coalescing works with ANY type of data, not just dictionaries:

let tvShows = ["breaking bad", "game of thrones", "bojack horseman"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Unknown"

let input = ""
let number3 = Int(input) ?? 0
print(number3)

//how to handle multiple optionals using optional changing
let names = ["Arya", "Bran", "Robb", "Sansa"]

//?. means 'if optional has a value, unwrap it, then continue
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

//get book's author, but give optionals in case author is missing and uppercase the first letter.

struct Book2 {
    let title: String
    let author: String?
}

var book2 : Book2? = nil
let author2 = book2?.author?.first?.uppercased() ?? "A"

print(author2)

//how to handle function failure with optionals

enum UserError: Error { //'Error' is swift protocol
    case badID, networkFailed
}

//with throwing function, we can specify the error:
func getUser(id: Int) throws -> String{
    throw UserError.networkFailed
}

//with optionals, we just check if any error was thrown inside the function, but if it fails, we don't get which error it was
if let user = try? getUser(id: 23){
    print("User: \(user)")
}


//extra parenthesis like logical comparison
let user = (try? getUser(id: 23)) ?? "Anonymus"
//attempt to call getUser for id 23
    //if it succeeds, put it into 'user' variable
    //if it fails, send back nil, which then uses nil coalescing to asign "anonymus"

//summary: optionals
    //optionals represent absence of data
    //everything that isn't optional necesarily has a value
    //unwrapping = look inside the optional and send value back if it has
    //if let runs code if optional has value, guard let runs code if optional doesn't
    // ?? -> nil coalescing operator, unwraps an optionals value or a devault value if optional is empty
    //optional chaining reads an optional inside another optional
    //try? can convert throwing functions so they return an optional

//-------------checkpoint 9-------------
//write a function that accepts an optional array of integers, and returns one of those integers randomly
//ir array is missing or empty, return a new random number in the range 1 through 100
//all of this in a single line of code


let array : [Int]? = nil

let check9 = array?.randomElement() ?? Int.random(in: 1...100)
print(check9)
