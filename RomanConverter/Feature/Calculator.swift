//
//  Calculator.swift
//  RomanConverter
//
//  Created by Emincan Antalyalı on 14.10.2023.
//

import Foundation

enum Chars: String {
    case I
    case V
    case X
    case L
    case C
    case D
    case M

    var num: Int {
        switch self {
            case .I:
                return 1
            case .V:
                return 5
            case .X:
                return 10
            case .L:
                return 50
            case .C:
                return 100
            case .D:
                return 500
            case .M:
                return 1000
        }
    }
}

final class Calculator {

    static   func convertRomanToInt(romanNumber: String) -> Int {
        var total = 0
        
        for i in 0..<romanNumber.count {
            if let firstNum = Chars(rawValue: String(romanNumber[i]))?.num
            {
                if i+1 < romanNumber.count{
                    if let secondNum =  Chars(rawValue: String(romanNumber[i+1]))?.num {
                        if firstNum >= secondNum {
                            total = total + firstNum;
                        }   else  {
                            total = total - firstNum
                        }
                    }

                }else{
                    total = total + firstNum
                }

            }
        }
        return total
    }

    static func checkNextSame(romanNumber: String) -> Bool {
        var total = 0
        for i in 0..<romanNumber.count {
            if let firstNum = Chars(rawValue: String(romanNumber[i]))?.num
            {
                if i+1 < romanNumber.count{
                    if let secondNum =  Chars(rawValue: String(romanNumber[i+1]))?.num {
                        if firstNum == secondNum {
                            total += 1
                        }   else  {
                            total = 0
                        }
                    }
                }
            }
        }
        if total > 2  {
            return false
        } else {
            return true
        }
    }
}
