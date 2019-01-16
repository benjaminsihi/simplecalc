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
        func convertStringToNum (_ input: String) -> Int {
            var result: Int = 0;
            for char in input {
                switch char {
                case "1":
                    result = result * 10 + 1
                case "2":
                    result = result * 10 + 2
                case "3":
                    result = result * 10 + 3
                case "4":
                    result = result * 10 + 4
                case "5":
                    result = result * 10 + 5
                case "6":
                    result = result * 10 + 6
                case "7":
                    result = result * 10 + 7
                case "8":
                    result = result * 10 + 8
                case "9":
                    result = result * 10 + 9
                case "0" :
                    result = result * 10 + 0
                default:
                    result = -1
                }
            }
            return result;
        }
        
        let simpleOperation:String = args[1]
        var result: Int = 0
        switch simpleOperation {
        case "+" :
            result = convertStringToNum(args[0]) + convertStringToNum(args[2])
        case "-" :
            result = convertStringToNum(args[0]) - convertStringToNum(args[2])
        case "/" :
            result = convertStringToNum(args[0]) / convertStringToNum(args[2])
        case "*" :
            result = convertStringToNum(args[0]) * convertStringToNum(args[2])
        case "%" :
            result = convertStringToNum(args[0]) % convertStringToNum(args[2])
        case "fact" :
            result = convertStringToNum(args[0])
            if result == 0 {
                result = 1
            }
            for index in 1...result {
                result *= index
            }
        default :
            if args[args.count - 1] == "count" {
                result = args.count - 2
            } else {
                for index in 0...args.count - 2 {
                    result += convertStringToNum(args[index])
                }
                result = result / (args.count - 2)
            }
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

