//
//  CalculateRPN.swift
//  CalculatorRPN
//
//  Created by Nurseit Akysh on 10/1/20.
//  Copyright © 2020 Nurseit Akysh. All rights reserved.
//

class CalculateRPN {
    private var expression:String
    
    init(expression:String) {
        self.expression = expression
    }
    // MARK: Convert infix expression value to postfix
    private func infixExpressionToPostfixRPN(expressionInfix:String) -> String {
        var currentExpression:String = ""
        var stack = Stack<Character>()
        
        for value in expressionInfix {
            let preority:Int = getPreority(token: value)
            
            if preority == 0 {
                currentExpression.append(value)
            } else if preority == 1 {
                stack.push(element: value)
            } else if preority > 1 {
                currentExpression += " "
                
                while !stack.isEmpty {
                    if getPreority(token: stack.peek()!) >= preority {
                        currentExpression.append(stack.pop()!)
                    } else {
                        break
                    }
                }
                
                stack.push(element: value)
                
                
            } else if preority == -1 {
                currentExpression += " "
                
                while getPreority(token: stack.peek()!) != 1 {
                    currentExpression.append(stack.pop()!)
                }
                
                _ = stack.pop()!
            }
        }
        
        while !stack.isEmpty {
            currentExpression += " "
            
            currentExpression.append(stack.pop()!)
        }
        
        return currentExpression
    }
    
// MARK: Computation expression
    
    private func expressionRPNCompute(expressionRPN:String) -> Double {
        let expressionRPNSplit:[Substring] = expressionRPN.split(separator: " ")
        var operand = Stack<Double>()
        
        for expressionValue in expressionRPNSplit {
            
            switch expressionValue {
            case "+":
                operand.push( element: operand.pop()! + operand.pop()!)
                break
            case "-":
                operand.push( element: operand.pop()! - operand.pop()!)
                break
            case "*":
                operand.push( element: operand.pop()! * operand.pop()!)
                break
            case "/":
                operand.push( element: operand.pop()! / operand.pop()!)
                break
            default:
                operand.push(element: Double(expressionValue)!)
            }
        }
        
        return operand.pop()!
    }
    
// MARK: Get preority value in number
    private func getPreority(token:Character) -> Int {
        switch token {
        case "*", "/":
            return 3
        case "+", "-":
            return 2
        case "(":
            return 1
        case ")":
            return -1
        default:
            return 0
        }
    }
    
    // MARK: Get answer RPN expression
    func getAnswer() -> Double {
        let postfixExpression = infixExpressionToPostfixRPN(expressionInfix: expression)
        
        return expressionRPNCompute(expressionRPN: postfixExpression)
    }
}

