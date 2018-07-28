//
//  Circle.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import Foundation

class Cirle: Shape {
    var area: Float
    var perimeter: Float
    var radius: Float
    
    init (radius: Float) {
        self.radius     = radius
        self.area       = 0.0
        self.perimeter  = 0.0
    }
    
    func getArea() -> Float {
        self.area = Float.pi * powf(self.radius, 2)
        return self.area
    }
    
    func getPerimeter() -> Float {
        self.perimeter = 2 * Float.pi * self.radius
        return self.perimeter
    }
}
