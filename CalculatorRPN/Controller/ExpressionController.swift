//
//  ButtonsController.swift
//  CalculatorRPN
//
//  Created by Nurseit Akysh on 9/27/20.
//  Copyright © 2020 Nurseit Akysh. All rights reserved.
//

class ExpressionController {
    
    // MARK: Model
    
    private var expressionModel: ExpressionModel?
    
    init(viewer: ViewController) {
        
        expressionModel = ExpressionModel(viewer: viewer)
    }
    
    // MARK: Acttion buttons methods
    
    func sendExpression(value: String) {
        
        expressionModel?.operationOf(expression: value)
    }
}
