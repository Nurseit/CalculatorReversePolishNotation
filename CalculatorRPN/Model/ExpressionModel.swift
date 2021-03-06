//
//  ExpressionModel.swift
//  CalculatorRPN
//
//  Created by Nurseit Akysh on 9/28/20.
//  Copyright © 2020 Nurseit Akysh. All rights reserved.
//

class ExpressionModel {
    
    private var newExpression: String = ""
    
    // MARK: Viewer
    
    private var mainViewer: ViewController!
    
    init(viewer: ViewController) {
        
        mainViewer = viewer
    }
    
    // MARK: Methods work with properity and operation with expression
    
    func operationOf(expression: String) {
        
        
        switch expression {
        case "=":
            newExpression = String(CalculateRPN(expression: newExpression).getAnswer())
        case "AC":
            newExpression = "0"
        default:
            if newExpression.count == 1 && newExpression == "0" {
                newExpression = ""
            }
            newExpression += expression
        }
        
        mainViewer.updateLabel(expression: newExpression)
    }
    
}
