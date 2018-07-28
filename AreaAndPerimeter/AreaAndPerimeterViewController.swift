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
    @IBOutlet var drawView: UIView!
    
    // Textfields
    @IBOutlet var value1Field: UITextField!
    @IBOutlet var value2Field: UITextField!
    
    // Value stacks
    @IBOutlet var value1Stack: UIStackView!
    @IBOutlet var value2Stack: UIStackView!
    
    @IBAction func changeShape(_ sender: UISegmentedControl) {
    }
    
    var shape:Shape
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
