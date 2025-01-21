import Cocoa

//how to create and use closures
func greetUser(){
    print("hi there!")
}

greetUser()

var greetCopy1 = greetUser

//() means accepts no parameters, void means returns no parameters. both are optional.
var greetCopy: () -> Void = greetUser //parenthesis -> run function and get return value, no parenthesis -> copy function

// () implies that it takes no parameters
// returns Void
greetCopy()

//closure = function that is treated like a variable.


let sayHello = {
    print("hi there")
}

sayHello()

//if you want parameters in closure
let sayHello2 = { (name: String) -> String in //closures requiere "in" to mark end of parameters. don't have returns since it's treated like variable.
"hi there \(name)"
}

//"for" externally, "id" internally
func getUserData(for id: Int) ->String{
    if id == 1989 {
        return "taylor swift"
    } else {
        return "anonymus"
    }
}


//func takes int, returns string
let data: (Int) -> String = getUserData
let user = data(1989) //when function is copied, the parameter "in" is lost
print(user)

let sayHello3 = { (name: String) -> String in
        "Hi \(name)!"
}


let team =  ["moash", "zzkaladin", "rock", "lopen", "sigzil"]

let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    
    if name1 == "zzkaladin"{
        return true
    } else if name2 == "zzkaladin"{
        return false
    }
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)

print(captainFirstTeam)

//same code but with closures

let captainFirstTeam2 = team.sorted(by : { (name1: String, name2: String) -> Bool in
    if name1 == "zzkaladin"{
        return true
    } else if name2 == "zzkaladin"{
        return false
    }
    return name1 < name2
    
    
})

print(captainFirstTeam2)

//How to use trailing closures and shorthand syntax

//shorter bny taking away variable types
let captainFirstTeam3 = team.sorted(by : { a,b in
    if a == "zzkaladin"{
        return true
    } else if b == "zzkaladin"{
        return false    }
    return a < b
})

//with trailing closure syntax: elimante 'by' and closing parenthesis

let captainFirstTeam4 = team.sorted { a,b in //'in' separates parameters and body of function
    if a == "zzkaladin"{
        return true
    } else if b == "zzkaladin"{
        return false    }
    return a < b
}

let captainFirstTeam5 = team.sorted {
    if $0 == "zzkaladin"{ //'$0' is automatic first parameter name
        return true
    } else if $1 == "zzkaladin"{ //$1 is second parameter
        return false    }
    return $0 < $1
}

//another example
let reverseTeam = team.sorted {
    return $0 > $1
}

//even simpler:
let rverseTeam2 = team.sorted{ $0 > $1 }

let zOnly = team.filter{$0.hasPrefix("z")}
print(zOnly)


//map => assign each element to another
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

//how to accept function as parameters

func greetUser2() {
    print("hi there")
}

var greetCopy3 : () -> Void  = greetUser2
greetCopy3()


//takes generator function which accepts no parameters but returns Ints. All of makeArray returns array of Ints, that is, [Int]
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size{
        let newNumber = generator() //call function asked for in parameter
        numbers.append(newNumber)
    }
    return numbers
}

//declare function inside
let rolls = makeArray(size: 50){
    Int.random(in: 1...20) //here we are detailing the function that it takes as a parameter using closures
}

//other way:
func generateNumber () -> Int {
    Int.random(in: 1...20)
}


//call with pre-made function as parameter
let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)


//multiple function parameters

func doImportantwork(first: () -> Void, second: ()-> Void, third: () -> Void){
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("done")
}

//define functions on the go
doImportantwork{
    print("this is the first work") //automatically assumes it's the first function
} second: {
    print("this is the second work")
} third: {
    print("this is the third work")
}

//chekcpoint 5

var luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

//filter out any even numbers, sort in ascending order, map them to strings in format "x is a lucky number", print the resulting array, one item per line.

var check5 = luckyNumbers.filter {!($0.isMultiple(of: 2))}.sorted {$0 < $1}.map {print("\($0) is a lucky number")}

print(check5)
