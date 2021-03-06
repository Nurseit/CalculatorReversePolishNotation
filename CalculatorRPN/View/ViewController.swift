//
//  ViewController.swift
//  CalculatorRPN
//
//  Created by Nurseit Akysh on 9/24/20.
//  Copyright © 2020 Nurseit Akysh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var expressionLabel: UILabel!
    
    // MARK: Controller
    
    private var expressionController: ExpressionController?
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        
        expressionController = ExpressionController(viewer: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonsView()
    }
    
    // MARK: Method get Nib View (xib file) and set in main view
    
    func addButtonsView() {
        
        if let buttonsView = Bundle.main.loadNibNamed("CalculatorButtonsView", owner: self, options: nil)?.first as? CalculatorButtonsViewClass {
            
            buttonsView.frame = CGRect(x: 0, y: self.view.bounds.midY + 7, width: self.view.frame.size.width, height: (self.view.frame.size.height / 2) - 41)
            buttonsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            view.addSubview(buttonsView)
        }
    }
    
    // MARK: Method action buttons
    
    @IBAction func buttonsSended(_ sender: UIButton) {
        
        expressionController?.sendExpression(value: sender.currentTitle!)
    }
    
    // MARK: Method update value text label
    
    func updateLabel(expression: String) {
        
        expressionLabel.text = expression
    }
    
}


// MARK: Extension UIButton for set properity button

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

