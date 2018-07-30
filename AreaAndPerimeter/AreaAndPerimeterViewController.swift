//
//  AreaAndPerimeterViewController.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class AreaAndPerimeterViewController: UIViewController {
    
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
    
    var shapes: [String:Shape]!
    var currentShape: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        drawView.shape = self.shapes[currentShape]
        setFields()
        drawView.setNeedsDisplay()
    }
    
    func setFields() {
        if let shape = self.shapes[self.currentShape] {
            drawView.shape = shape
            drawView.setNeedsDisplay()
            
            shapeLabel.text = currentShape.uppercased()
            
            perimeterLabel.text = "\(shape.getPerimeter()) cm"
            perimeterFormulaLabel.text = shape.formulae["perimeter"]
            
            areaLabel.text = "\(shape.getArea()) cm"
            areaFormulaLabel.text = shape.formulae["area"]
            
            switch currentShape {
            case "Circle":
                value2Stack.isHidden = true
                value1Field.text = "\((shape as! Circle).radius) cm"
                value1Label.text = "r ="
            case "Square":
                value2Stack.isHidden = true
                value1Field.text = "\((shape as! Square).length) cm"
                value1Label.text = "x ="
            case "Rectangle":
                value2Stack.isHidden = false
                value1Field.text = "\((shape as! Rectangle).width) cm"
                value1Label.text = "w ="
                value2Field.text = "\((shape as! Rectangle).height) cm"
                value2Label.text = "h ="
            default:
                preconditionFailure("The shape \"\(currentShape)\" does not exist.")
            }
            
        }
    }
}
