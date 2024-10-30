import UIKit

//*******Questions******//

// 1. In which year was the first version of the Swift programming language introduced? Explain about type safety and type inference in Swift?
print("The first version of the Swift programming language was introduced in 2014.Type safety ensures that variables are only used in ways that are appropriate for their type, reducing errors and improving code reliability.")
print("Type inference allows Swift to automatically deduce the type of a variable or constant from its initial value, reducing the need for explicit type declarations.")
print("---------------------------------------")
// End of question 1

// 2. Declare a constant 'pi' of type Double and assign it the value 3.14. Calculate the volume of a cylinder with a diameter of 15 and height of 12.0 units. Print the obtained result as shown in sample output.
let pi: Double = 3.14
var diameter: Double = 15.0
var height: Double = 12.0
let radius = diameter / 2
let volume = pi * radius * radius * height
print("The volume of Cylinder is \(volume) units.")
print("---------------------------------------")
// End of question 2

// 3. Declare a variable with a value of 102.9°F, convert it to Celsius, and round it to two decimal places. Then, print the result in the following format using a single print statement.
var fahrenheit: Double = 102.9
let celsius = (fahrenheit - 32) * 5 / 9
let roundedCelsius = String(format: "%.2f", celsius)
print("Fahrenheit: \(fahrenheit) F and Celsius: \(roundedCelsius) C")
print("---------------------------------------")
// End of question 3

// 4. Write four aspects about your career aspirations using four print statements and display the first three aspects on the first line, and the fourth aspect on the next line.
print("I aspire to develop innovative software solutions, work on cutting-edge technology, and lead a team of talented developers.")
print("I am also committed to continuous learning and improving my skills.")
print("I aim to contribute to impactful projects that enhance people's lives.")
print("Ultimately, I hope to make a significant impact in the tech industry.")
print("---------------------------------------")
// End of question 4

// 5. Display the following using a single print statement.
var statement = """
Swift is a safe and fast programming language that combines the best in modern language thinking with wisdom from diverse open source. It is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS.
Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love.
Its an industrial quality programming language. The compiler is optimized for performance and the language is optimized for development.
The Swift programming offers safety and speed. It provides type inference, pattern matching.
Swift code is safe by design and produces software that runs lightning-fast.
print("---------------------------------------")
"""
// End of question 5

// 6. Declare a variable called 'number1' and assign it a three-digit integer. Next, declare another variable called 'number2' and assign it a different three-digit integer. Then, create a third variable named 'product' to store the result of multiplying 'number1' and 'number2'. Write code to calculate the number of digits in the product and print the result.
var number1 = 987
var number2 = 118
var product = number1 * number2
var numberOfDigits = String(product).count
print("The product of two numbers \(number1) and \(number2) is \(product) and it contains \(numberOfDigits) digits.")
print("---------------------------------------")
// End of question 6

// 7. Create a variable with value "Welcome to iOS Mobile Computing Class!!". Print the total number of characters in the above text excluding spaces and then print each character separated by "+".
var text = "Welcome to iOS Mobile Computing Class!!"
var textWithoutSpaces = text.replacingOccurrences(of: " ", with: "")
var characterCount = textWithoutSpaces.count
print("The number of characters excluding spaces in the above text is \(characterCount)")
let charactersWithPlus = textWithoutSpaces.map { String($0) }.joined(separator: "+")
print("The modified text is:\n \(charactersWithPlus)")
print("---------------------------------------")
// End of question 7

// 8. An object begins its motion with an initial velocity of 8.75 m/s and accelerates at a constant rate of 4.25 m/s² along a straight path. Its final velocity at the end of the motion is 12.5 m/s. Calculate the displacement of the object and print the result in the specified format using print statements.
var initialVelocity: Double = 8.75
var finalVelocity: Double = 12.5
var acceleration: Double = 4.25
let displacement = ((finalVelocity * finalVelocity) - (initialVelocity * initialVelocity)) / (2 * acceleration)
print("Initial Velocity: \(initialVelocity) m/s")
print("Final Velocity: \(finalVelocity) m/s")
print("Displacement: \(displacement) m")
print("---------------------------------------")
// End of question 8



