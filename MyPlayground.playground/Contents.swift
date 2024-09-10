import UIKit

var greeting = "Hello, playground"
print("Hi", 10, 12.25)

print("Swift class \(greeting)")

var income = 12.0
print("My income per hour is \(income)")

print("""
HELLO WORLD!!!
""")

let welcomeMessage : String = "Hi!"
print(welcomeMessage, "All")
       
print("welcome to Swift Programming")
print("Fall 2024")
print("************")
print("welcome to Swift Programming" , terminator : ":" )
print("Fall 2024")

print("The list of numbers are:")
print(1,2,3,4,5,6)
print("The new pattern is:")
print(1,2,3,4,5,6, separator: "-")

//tuple
var httpError = (errorCode : 404 , errorMessage : "Page Not Found")
print(httpError)
print(httpError.errorCode , terminator: ":")
print(httpError.errorMessage )

var name = ("Sra","Kotha")
var fname = name.0
var lname = name.1
print(fname , terminator: ",")
print(lname)

let city = (name : "Maryville" , population : 11000)
let(cityName, cityPopulation) = (city.0 , city.1)
print(cityName)
print(cityPopulation)


var origin = (x : 0 , y : 0)
var point = origin
print(point)

//(0,0)
print(" (\(origin.x) , \(origin.y))")

var programmingLanguage = "Swift"
print("MY FAVORITE PROGRAMMING LANGUAGE IS \(programmingLanguage)")

var age = 23
print("you are \(age) years old and in another \(age) years, you will be \(age * 2)")

//variables
var mobileBrand = "Apple"
mobileBrand = "Samsung"
print(mobileBrand)

let pi = 3.14
print(pi)

//explicit declaration
var yearsOld : Int = 23
yearsOld = yearsOld * 2
print(yearsOld)

var awesomeMessage = "She is a miracle artist"
print(awesomeMessage)
print("awesomeMessage")

var cou1 = "IOS"
var cou2 = "Android"
print(cou1,cou2)
print(cou1,"-",cou2)

print(10, 20, 30)
print(12.5,15.5)


