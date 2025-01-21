import Cocoa

var greeting = "Hello, playground"

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms{
    print("Swift works great on \(os).")
}

for i in 1...12{ //ranges specified with "...", inclusive
    print("The \(i) times table")
    for j in 1...12{
        print("\(i) x \(j) = \(i * j)")
    }
    print("\n")
}

for i in 1..<5{ //excludes upper limit
    print("\(i)")
}

var lyric = "haters gonna"

for _ in 1...5{
    
    lyric += " hate"
}
 print(lyric)

//part 2: while
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("blast off")


let id = Int.random(in: 1...1000)
let amount = Double.random(in:0...1)

var roll = 0

while roll != 20 {
    
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("critical hit")

//skip loop items with break and continue
    //continue = skips that iteration
    //break = exits loop
let filenames = ["asdf.jpg", "work.txt", "hello.png"]

for filename in filenames {
    
    if filename.hasSuffix("jpg") == false{
        continue
    }
    print("found picture: \(filename)")
}

let number1 = 4
let number2 = 14

var multiples = [Int]()

for i in 1...100_000{
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        if multiples.count == 10{
            break
        }
    }
    
}
print(multiples)


//checkpoint 3 (quiz)
//loop 1-100. if it's multiple of 3, print "fizz". if it's multiple of 5, print "buzz", if its multiple of 3 and 5, print "fizzbuzz". otherwise, print the number.

for i in 1...100{
    if i.isMultiple(of: 3)&&i.isMultiple(of: 5){
        print("fizzbuzz")
    }
    else if i.isMultiple(of: 5){
        print("buzz")
    }
    else if i.isMultiple(of: 3){
        print("fizz")
    }
    else{
        print(i)
    }

    
}


//day 7: functions

func showWelcome(){
    print("welcome to my app!")
    print("by default this prints out a conversion")
    print ("chart from centimiters to inches, but you")
    print("can also set a custom range if you want")
}

showWelcome() //"call site"

func printTimesTable(number: Int, end:Int){ //"number" will be the name of the int variable inputed in function. same for "end". "number" and "end" are called "parameters", which are the placeholders.
    for i in 1...end{
        print("\(i) * \(number) is \(i * number)")
    }
    
}

//data inside of the function is destroyed after function is done being executed.
 
printTimesTable(number: 675, end: 20) //data being sent (675, 20) are called "arguments".

//return values from functions

let root = sqrt(169)
print(root)


func rollDice() -> Int{ //"Int" specifies that it will RETURN an integer.
    return Int.random(in : 1...6)
}



let result = rollDice()
print(result)

//do two strings contain the same letters, regardless of their order? 1)accept two string parameters, 2) return true if the letters are the same.

func sameLetters(s1: String, s2: String) -> Bool{
    return s1.sorted() == s2.sorted()
}

var test = sameLetters(s1: "abc", s2: "bca")
print(test)


func pythagorean(a: Double, b: Double) -> Double{
    return sqrt(a * a + b * b)
}

print(pythagorean(a: 3, b: 1))

func sayHello(){
    
    return //just exits the function
}

//return multiple values from functions
func getUser() -> [String: String]{ //returns dictionary
    ["firstName" : "Taylor", "lastName": "Swift"]
}

let user = getUser()
print("Name : \(user["firstName", default : "?"]) \(user["lastName", default : "?"])")

//return tuple:
//no need to re-declare 'return' because it's on the tuple.

func getUser2() -> (firstName: String, lastName : String){
    (firstName : "Taylor", lastName: "Swift")
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

func getUser3() -> (String, String){
    (firstName : "Taylor", lastName: "Swift")
}

//to access tuples without name, we use indexes
let user3 = getUser3()
print("Name: \(user3.0) \(user3.1)")

let (firstName3, lastName3) = getUser3() //store tuple in individual variables
print("Name: \(firstName3), \(lastName3)")

//customize parameter labels

func rollDice(sides: Int, count: Int) -> [Int]{
    var rolls = [Int]()
    
    for _ in 1...count{
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    return rolls
}

let lyric2 = "I see a red door and I want it painted black"

print(lyric2.hasPrefix("I see")) //has no label

//to remove external parameter name, we use underscore + space:
func isUpperCase(_ string: String) -> Bool{
    string == string.uppercased()
}

let string2 = "HELLO WORLD"
let result2 = isUpperCase(string2) //has label!


//add parameter name:
func printTimesTable3(for number: Int){ //'for' used externally, 'number' used internally
    for i in 1...12{
        print("\(i) x \(number) = \(i * number)")
    }
}

//'for' is argument label.
printTimesTable3(for: 5)



