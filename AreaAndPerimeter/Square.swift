//
//  Square.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Square: Shape {
    var area: Float
    var perimeter: Float
    
    var length: Float {
        didSet {
            self.calculateShapePaths()
        }
    }
    
    var shapePaths: [UIBezierPath]
    var bounds: CGRect!
    
    var formulae:[String:String] = [
        "area":  "x²",
        "perimeter": "4 • x"
    ]
    
    init(length: Float) {
        self.length     = length
        self.area       = 0.0
        self.perimeter  = 0.0
        self.shapePaths = []
    }
    
    func getArea() -> Float {
        self.area = powf(length, 2)
        return self.area
    }
    
    func getPerimeter() -> Float {
        self.perimeter = self.length * 4
        return self.perimeter
    }
    
    func calculateShapePaths(bounds: CGRect) {
        var shapePaths:[UIBezierPath] = []
        
        let lineWidth:CGFloat = 5
        let length = min(bounds.width, bounds.height) - lineWidth - 10
        let x = (bounds.width - length) / 2.0
        let y = (bounds.height - length) / 2.0
        
        let shapePath = UIBezierPath(rect: CGRect(x: x, y: y, width: length, height: length))
        shapePath.lineWidth = lineWidth
        shapePaths.append(shapePath)
        
        self.shapePaths = shapePaths
    }
    
    func calculateShapePaths() {
        self.calculateShapePaths(bounds: self.bounds)
    }
}
