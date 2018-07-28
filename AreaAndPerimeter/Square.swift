//
//  Square.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import Foundation

class Square: Shape {
    var area: Float
    var perimeter: Float
    var length: Float
    
    init(length: Float) {
        self.length     = length
        self.area       = 0.0
        self.perimeter  = 0.0
    }
    
    func getArea() -> Float {
        self.area = powf(length, 2)
        return self.area
    }
    
    func getPerimeter() -> Float {
        self.perimeter = self.length * 4
        return self.perimeter
    }
}
