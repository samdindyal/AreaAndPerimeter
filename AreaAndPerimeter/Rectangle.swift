//
//  Rectangle.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import Foundation

class Rectangle: Shape {
    var area: Float
    var perimeter: Float
    var length: Float
    var width: Float
    
    init(length: Float, width: Float) {
        self.length = length
        self.width  = width
        
        self.perimeter  = 0.0
        self.area       = 0.0
    }
    
    func getArea() -> Float {
        self.area = self.length * self.width
        return self.area
    }
    
    func getPerimeter() -> Float {
        self.perimeter = 2 * ( self.length + self.width )
        return self.perimeter
    }
    
    
}
