import UIKit

var greeting = "Hello, playground"

print(4 > 5 && 8 > 3) //false
print(5 > 7 || 8 < 2 * 5) //true
print(!(5 <= 4 || 6 != 5 && 10 >= 4)) //false

var x : Int = 12
var y : Int = 7
var z : Int = 5
var a : Bool = true
var b : Bool = false
print("\(x - z == y)") //true
print("\(x * z > z * y || b)") //true
print("\(x * z < z * y && a)") //false
print("\(x * z > z * y && a || b)") //true
print(!(x * z > z * y && a || b)) //false

var firstNum : Int = 10
var secNum : Int = 20
print(secNum / firstNum) //2

var four = 4
var finalNum = -4
print(finalNum) //-4

var num1 = (3,4)
var num2 = (4,5)
print(num1 > num2) //fal

var marks = 45
if marks > 50 {
    print("Student has passed with \(marks) marks")
}else{
    print("Student had managed to get \(marks) marks")
    } //45

var inpNum = -10
if inpNum > 0 {
    print("\(inpNum) is a positive number")
}else if(inpNum < 0){
    print("\(inpNum) is a negative number")
    if(inpNum % 2 == 0){
        print("\(inpNum) is a negative even number")
    }
}else{
    print("num is 0")
} //-10

var stars = 65
if(stars >= 90) {
print("You are a Pro Member")
}
else if (stars>=78 && stars<90){
print("You are a Gold Member")
}
else if (stars>=65 && stars<78) {
print("You are a VIP Member")
}
else {
print("Default Plan")
} //65


var password : String = "Sravani1834"
if(password.count>8){
if(password.contains(" ")){
print("Password Should not contain space")
}
else{
print("Password is Strong") //ans
}
}
else
{
print("A password should be minimum of 8 characters")
}


var male : Bool = false
var age = 45
if male {
if age<20 {
print("Boy")
}else {
print("Man")
}
}else{
    if age<20{
        print("Girl")
    }else{
        print("Women")
    }
}

//switch ststements

let alpha : Character = "a"
switch alpha {
case "a", "A":
    print("it is a alphabet a or A")
case "b", "B":
    print("it is a alphabet a or A")
case "c", "C":
    print("it is a alphabet a or A")
default:
    print("none of the above")
}


let isVowel : Character="e"
switch isVowel {
case "a","e","i","o","u":
print("The alphabet is a lower case vowel")
case "A","E","I","O","U":
print("The alphabet is an upper case vowel")
default:
print("The alphabet is a consonant")
}


let isHot : Double = -10.0
switch isHot {
case 60...95:
print(" It's really warm. Don't forget to wear sunscreen.")
case 35...60:
print("It's not that cold. Wear a t-shirt.")
case ..<35:
print("It's very cold. Consider wearing a scarf.")
default:
print("The temperature is Unbearable")
}

      
var s : Int=3
var t : Int=4
var u : Int=5
switch s {
case 5:
print("\(u)~",terminator:"")
case 3:
print("\(s)~",terminator:"")
switch t {
case 3:
print("\(s)~",terminator:"")
case 4:
print("\(t)~",terminator:"")
switch u {
case 5:
print("\(u)~",terminator:"")
case 4:
print("\(t)~",terminator:"")
default:
print("No Matching case found")
}
default:
print("No Matching Case found")
}
default:
print("No number is matching")
}


