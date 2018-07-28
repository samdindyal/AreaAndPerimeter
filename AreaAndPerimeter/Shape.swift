//
//  Shape.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import Foundation

protocol Shape {
    var area:Float { get }
    var perimeter:Float { get }
    func getArea() -> Float
    func getPerimeter() -> Float
}
