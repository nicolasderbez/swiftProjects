import Cocoa

//how to provide default values for parameters

//'=12' is default value for parameter
func printTimesTables(for number: Int, end: Int = 12){
    for i in 1...end{
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5, end : 20)
printTimesTables(for: 5)


var characters = ["kaladin", "dalinar", "shallan", "adolin"]

print(characters.count)
characters.removeAll(keepingCapacity: true) //keeps the number of spaces available in the array. otherwise, its size is 0 to preserve memory.
print(characters.count)

//how to handle errors in functions

//1: define all of the errors that might happen
//2: write function but can throw errors if problem is found.
//3: run function and handle errors

enum passwordError: Error {
    case short, obvious
}

func checkPassword (_ password: String) throws -> String{
    
    if password.count < 5 {throw passwordError.short}
    if password == "12345" {throw passwordError.obvious}
    
    
    if password.count < 8 {
        return "ok"
    } else if password.count < 10 {
        return "good"
    } else {
        return "excelent"
    }
}

//do, try, catch
let string = "12345"


//'try' must be written before all throw functions
do {
    let result = try checkPassword(string)
    print("password rating: \(result)")
} catch passwordError.short{ //here we handle error
    print("please use a longer password")
}
catch passwordError.obvious{
    print("please use a less obvious password")
}catch{
    print("there was an error: \(error.localizedDescription)")
} //works as an 'else' for unexpected errors, and explains in simple language

// exclamation means you're sure there are no errors.
//  let result = try! checkPassword(string)
//  print("password rating: \(result)")


//checkpoint 4: write function that accepts an integer parameter from 1-10000 and return the integer square root of that number.
        //can't use the built in sqrt() function, find it.
        //if number is less than 1 or greater than 10,000, throw "out of bounds" error
        //only consider integer square roots
        //if it can't find a square root, throw a "no root" error"

 enum sqrtError: Error {
    case outOfBounds
    case decimalRoot
    case decimalInput
}

func wholeSqrt(_ number: Int) throws -> Int {
    if number < 0 {throw sqrtError.outOfBounds}
    if number > 10000 {throw sqrtError.outOfBounds}
    for i in 1...101{
        var value = i * i
        if value == number {
            return i
        }
        if i == 101 {throw sqrtError.decimalRoot}
    }
    return 0
}


let num = 25
do{
    let result = try wholeSqrt(num)
    print("the square root of \(num) is \(result)")
}catch sqrtError.decimalRoot{
    print("the number does not have a whole square root")
}catch sqrtError.outOfBounds{
    print("please enter a number between 1-10000")
}


