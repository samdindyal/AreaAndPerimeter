//
//  Shape.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-28.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

protocol Shape {
    var area:Float { get }
    var perimeter:Float { get }
    var shapePaths:[UIBezierPath] { get }
    var bounds:CGRect! { get }
    var formulae:[String:String] { get }
    
    func getArea() -> Float
    func getPerimeter() -> Float
    func calculateShapePaths(bounds: CGRect)
    func calculateShapePaths()
}
