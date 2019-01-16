//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        // Pre: it assumes the user only give numerical input or minus sign.
        // Post: it takes a String and transform it to integer.
        func convertStringToNum (_ input: String) -> Int {
            var result: Int = 0;
            var inputString:String = input
            inputString.remove(at: inputString.startIndex)
            if input[input.startIndex] == "-" {
                result = -1 * Int(inputString)!
            } else {
                result = Int(input)!
            }
            return result;
        }
        
        var result: Int = 0
        
        // Test on three special cases "count", "avg", "fact".
        // They locate at the end of array.
        if args[args.count - 1] == "count" {
            if args.count >= 2 {
                result = args.count - 1
            }
            return result
        } else if args[args.count - 1] == "avg" {
            if args[0] != "avg" {
                for index in 0...args.count - 2 {
                    result += convertStringToNum(args[index])
                }
                if args.count - 2 > 0 {
                    result = result / (args.count - 1)
                }
            }
            return result
        } else if args[args.count - 1] == "fact" {
            if (args[0] != "fact") {
                let input:Int = convertStringToNum(args[0])
                result = 1
                // The factorial for negative number doesnt' exist
                if input > 0 { // for postitive values
                    for index in 1...input {
                        result *= index
                    }
                }
            }
            return result
        }
        
        // if/else if structure of simple computation, such as addition and subtraction.
        let simpleOperation:String = args[1]
        if simpleOperation == "+" {
            result = convertStringToNum(args[0]) + convertStringToNum(args[2])
        } else if simpleOperation == "+" {
            result = convertStringToNum(args[0]) - convertStringToNum(args[2])
        } else if simpleOperation == "/" {
            result = convertStringToNum(args[0]) / convertStringToNum(args[2])
        } else if simpleOperation == "*" {
            result = convertStringToNum(args[0]) * convertStringToNum(args[2])
        } else if simpleOperation == "%"{
            result = convertStringToNum(args[0]) % convertStringToNum(args[2])
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

