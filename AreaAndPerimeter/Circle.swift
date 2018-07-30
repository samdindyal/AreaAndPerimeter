//
//  Circle.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Circle: Shape {
    var area: Float
    var perimeter: Float
    var radius: Float {
        didSet {
            self.calculateShapePaths()
        }
    }
    
    var shapePaths: [UIBezierPath]
    var bounds: CGRect!
    
    let formulae:[String:String] = [
        "area":  "π • r²",
    "perimeter": "2 • π • r"
    ]
    
    init (radius: Float) {
        self.radius     = radius
        self.area       = 0.0
        self.perimeter  = 0.0
        self.shapePaths  = []
    }
    
    func getArea() -> Float {
        self.area = Float.pi * powf(self.radius, 2)
        return self.area
    }
    
    func getPerimeter() -> Float {
        self.perimeter = 2 * Float.pi * self.radius
        return self.perimeter
    }
    
    func calculateShapePaths(bounds: CGRect) {
        var shapePaths:[UIBezierPath] = []
        
        let lineWidth:CGFloat = 5
        let diameter = min(bounds.width, bounds.height) - lineWidth - 10
        let x = (bounds.width - diameter) / 2.0
        let y = (bounds.height - diameter) / 2.0
        
        let shapePath = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: diameter, height: diameter))
        shapePath.lineWidth = lineWidth
        shapePaths.append(shapePath)
        
        self.shapePaths = shapePaths
    }
    
    func calculateShapePaths() {
        self.calculateShapePaths(bounds: self.bounds)
    }
}
