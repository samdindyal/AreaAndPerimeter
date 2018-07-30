//
//  AreaAndPerimeterViewController.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class AreaAndPerimeterViewController: UIViewController, UITextFieldDelegate {
    
    // Labels
    @IBOutlet var shapeLabel: UILabel!
    @IBOutlet var value1Label: UILabel!
    @IBOutlet var value2Label: UILabel!
    @IBOutlet var areaFormulaLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var perimeterFormulaLabel: UILabel!
    @IBOutlet var perimeterLabel: UILabel!
    
    // View for drawing shape
    @IBOutlet var drawView: DrawView!
    
    // Textfields
    @IBOutlet var value1Field: UITextField!
    @IBOutlet var value2Field: UITextField!
    
    // Value stacks
    @IBOutlet var value1Stack: UIStackView!
    @IBOutlet var value2Stack: UIStackView!
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
        if let currentShape = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            self.currentShape = currentShape
            setFields()
        }
    }
    
    @IBAction func userInput(_ sender: UITextField) {
        switch currentShape {
        case "Circle":
            if let circle = shapes[currentShape] as? Circle,
                let radius = Float(value1Field.text!) {
                circle.radius = radius
            } else {
                perimeterLabel.text = "???"
                areaLabel.text = "???"
                return
            }
        case "Rectangle":
            if let rectangle = shapes[currentShape] as? Rectangle,
                let height = Float(value1Field.text!),
                let width = Float(value2Field.text!){
                rectangle.height = height
                rectangle.width  = width
            } else {
                perimeterLabel.text = "???"
                areaLabel.text = "???"
                return
            }
        case "Square":
            if let square = shapes[currentShape] as? Square,
                let length = Float(value1Field.text!) {
                square.length = length
            } else {
                perimeterLabel.text = "???"
                areaLabel.text = "???"
                return
            }
        default:
            preconditionFailure("Invalid shape!")
        }
        
        self.recalculate()
    }
    
    var shapes: [String:Shape]!
    var currentShape: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        drawView.shape = self.shapes[currentShape]
        setFields()
        drawView.setNeedsDisplay()
    }
    
    func recalculate() {
        if let shape = self.shapes[self.currentShape] {
            perimeterLabel.text = "\(shape.getPerimeter()) cm"
            perimeterFormulaLabel.text = shape.formulae["perimeter"]
            
            areaLabel.text = "\(shape.getArea()) cm"
            areaFormulaLabel.text = shape.formulae["area"]
        }
    }
    
    func setFields() {
        if let shape = self.shapes[self.currentShape] {
            drawView.shape = shape
            drawView.setNeedsDisplay()
            
            shapeLabel.text = currentShape.uppercased()
            
            self.recalculate()
            
            switch currentShape {
            case "Circle":
                value2Stack.isHidden = true
                value1Field.text = "\((shape as! Circle).radius)"
                value1Label.text = "r ="
            case "Square":
                value2Stack.isHidden = true
                value1Field.text = "\((shape as! Square).length)"
                value1Label.text = "x ="
            case "Rectangle":
                value2Stack.isHidden = false
                value1Field.text = "\((shape as! Rectangle).width)"
                value1Label.text = "w ="
                value2Field.text = "\((shape as! Rectangle).height)"
                value2Label.text = "h ="
            default:
                preconditionFailure("The shape \"\(currentShape)\" does not exist.")
            }
            
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let existingTextHasSeparator = textField.text?.range(of: ".")
        let replacementTextHasSeparator = string.range(of: ".")
        
        return existingTextHasSeparator == nil || replacementTextHasSeparator == nil
    }
}
