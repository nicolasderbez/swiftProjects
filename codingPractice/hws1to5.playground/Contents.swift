import Cocoa

//Day 2


var isAuthenticated = false

isAuthenticated = !isAuthenticated

print(isAuthenticated)

//Join strings
let greeting = "hello"
let place = "world!"

let phrase = greeting + " " + place
print(phrase)

let code = "2" + "3" + "4"
print(code)

let name = "nico"
let age = 23

let message = "hello, i'm \(name) and i´m \(age) years old"
print(message)

let number = 11
let missionMessage = "Apollo \(number) landed on the moon"

print("5*5 = \(5*5)")

//Day 3: Arrays, Dictionaries, data lookup and enums

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 5, 7, 8]
let temps = [35.3, 28.4, 35.8]

print(beatles[0])

beatles.append("yoko")

print(beatles)

var scores = Array<Int>() //specify type
scores.append(10)
scores.append(20)
scores.append(30)
scores.append(40)
scores.append(50)

print(scores)
  
var albums = [String]() //other way to specify type
//if you don't specify type, it takes the first item
albums.append("Abbey Road")
albums.append("Sgt. Pepper's Lonely Hearts Club Band")
albums.append("Revolver")
print(albums.count)

var characters = ["walter", "jessee", "saul"]
characters.remove(at: 2)
print(characters)
characters.removeAll()
print(characters)

let harryPottermovies = ["sorceres stone", "chamber of secrets", "prisoner of azkaban"]

print(harryPottermovies.contains("prisoner of azkaban"))

let cities = ["mid", "cdmx", "gdl", "mty"]
print(cities.sorted())

let numbers2 = [1, 2, 3, 4, 5]

let reverseNums2 = numbers2.reversed()
print(reverseNums2)//reverses as it requests data, does not rearrange at the moment

//dictionaries

let employee2 = [
    "name" : "nico",
    "job" : "programmer",
    "city" : "cdmx"
    ]

print(employee2["name", default:"unknown"]) //default is value if key is not found
print(employee2["job", default:"unknown"])
print(employee2["city", default:"unknown"])

let hasGraduated = [
    "nico" : false,
    "paolo" : true,
    "kyra" : true,
    "reza" : false,

]

var weight = [String:Int]() //creating ditionaries specifying data type
weight["nico"] = 68
weight["paolo"] = 70
weight["reza"] = 100

print(weight)

//sets: highly optimized, but they don't store either duplicates or indexes (order)

let actors = Set([
    "Daniel Radcliffe",
    "Emilia Clarke",
    "Tom Cruise",
    "Sydney Sweenie"
])

var singers = Set<String>()
singers.insert("Justin Bieber")
singers.insert("Taylor Swift")
singers.insert("Kendrick Lamar")
print(actors)
print(singers)

//enum: enumeration, set of name values

var selected = "monday"
selected = "Tuesday"
selected = "January" //not an error in code, but in design

//enums define a type of data that can only be assigned certain values.

enum weekday {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var day = weekday.monday
//only make the declaration once when creating the variable
 day = .tuesday

//test 2: create an array of strings, then write some code that prints out the number of items in the array and also the number of unique items in the array.

var test = Array<String>()
test.append("nico")
test.append("alonso")
test.append("reza")
test.append("paolo")
test.append("nico")

print(test.count)


var set = Set(test)
print(set.count)

//day 5

//ifs

let score = 85

if score >= 90 {
    print("A")
}

let speed = 88
let percentage = 85
let age2 = 18

if speed >= 88 {
    print("where we're going we don't need roads")
}

if age2 >= 18 {
    print("you are able to vote")
}

let ourName = "Nico"
let friendName = "Alonso"

if ourName > friendName{
    print("\(ourName) comes later in the alphabet")
}

if friendName > ourName{
    
    print("\(friendName) comes later in the alphabet")
}

var numbers3 = [1,2,3,4]

if numbers3.count > 3 {
    
    numbers3.remove(at: 0)
}

let country = "canada"

if country == "mexico"{
    print("que onda")
}

if country != "canada"{
    print("tim hortons")
}

var username = "nicoloco123"

if username == ""{
    username = "Anonymus"
}

if username.count == 0{
    username = "Anonymus"
}

if username.isEmpty == true {
    username  = "Anonymus"
}

if username.isEmpty{
    username = "Anonymus"
}



print("welcome, \(username)")

let currentAge = 22

if currentAge >= 23{
    print("you should have finished college")
} else {
    print("you haven't finished college")
}

if currentAge > 18 && currentAge < 23{
    print("you should be in college")
}

let userAge = 14
let parentalConsent = true

//or
if age >= 18 || parentalConsent == true{
    print("you can buy the game")
}

enum transport{
    case airplane, helicopter, bike, car, bicycle
}

var transportOption = transport.bike

if transportOption == .bike || transportOption == .bicycle {
    print("let's ride")
} else if transportOption == .car{
    ("enjoy the traffic")
}else{
    print("lol ok")
}


enum Weather {
    
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast{
case .sun:
    print("nice day")
case .rain:
    print("pack an umbrella")
case .wind:
    print("wear a windbreaker")
case .snow:
    print("school is canceled")
case .unknown:
    print("apocalypse time")
}

let home = "hogwarts"

switch home{
case "hogwarts":
    print("you're ravenclaw")
case "shattered plains":
    print("you're bridge four")
default: //default at the end because otherwise it wont run the rest of the code
    print("who are you")
}


let day1 = 5
print("My true love gave to me")
switch day1{
case 5:
    print("5 golden rings")
    fallthrough //goes to next case
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 french hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("a partridge in a pear tree")
}

//ternary conditional operator for quick tests
//useful because it lets us have a condition check inside a print, which otherwise can't be made
let ageNow = 18
let canVote = ageNow >= 18 ? "Yes" : "No"
//ternary operator has three parts:
    //condition: ageNow >= 18
    //condition if true : "Yes"
    //condition if false: "No"
    //mnemonic: "WTF": What, True, False

let hour = 23
print(hour < 12 ? "before noon" : "after noon")

let names4 = ["walt", "jessee", "saul"]
let crewCount = names4.isEmpty ? "no one" : "\(names4.count) people"

print(crewCount)

enum Theme{
    case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "black" : "white"

print(background)







