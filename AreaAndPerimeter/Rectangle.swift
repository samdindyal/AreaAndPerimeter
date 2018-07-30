//
//  Rectangle.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Rectangle: Shape {
    var area: Float
    var perimeter: Float
    
    var height: Float {
        didSet {
            self.calculateShapePaths()
        }
    }
    var width: Float {
        didSet {
            self.calculateShapePaths()
        }
    }
    
    var shapePaths: [UIBezierPath]
    var bounds: CGRect!
    
    let formulae:[String:String] = [
        "area":  "l • w",
        "perimeter": "2 • (l + w)"
    ]
    
    init(width: Float, height: Float) {
        self.height = height
        self.width  = width
        
        self.perimeter  = 0.0
        self.area       = 0.0
        
        self.shapePaths  = []
    }
    
    func getArea() -> Float {
        self.area = self.height * self.width
        return self.area
    }
    
    func getPerimeter() -> Float {
        self.perimeter = 2 * ( self.width + self.height )
        return self.perimeter
    }
    
    func calculateShapePaths(bounds: CGRect) {
        var shapePaths:[UIBezierPath] = []
        
        let lineWidth:CGFloat = 5.0
        
        let heightRatio = self.height / Float(bounds.height)
        let widthRatio = self.width / Float(bounds.width)
        
        let sizeRatio = max(heightRatio, widthRatio)
        
        
        let width = CGFloat(self.width / sizeRatio) - lineWidth - 10.0
        let height = CGFloat(self.height / sizeRatio) - lineWidth - 10.0
        let x = (bounds.width - CGFloat(width)) / 2.0
        let y = (bounds.height - CGFloat(height)) / 2.0
        
        let shapePath = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: height))
        shapePath.lineWidth = lineWidth
        shapePaths.append(shapePath)
        
        self.shapePaths = shapePaths
        self.bounds = bounds
    }
    
    func calculateShapePaths() {
        self.calculateShapePaths(bounds: self.bounds)
    }
    
}
