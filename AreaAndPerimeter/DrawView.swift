//
//  DrawView.swift
//  AreaAndPerimeter
//
//  Created by Sam Dindyal on 2018-07-29.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var shape: Shape! {
        didSet {
            self.shape?.calculateShapePaths(bounds: self.bounds)
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        if let paths = shape?.shapePaths {
            for path in paths {
                UIColor.darkGray.setStroke()
                path.stroke()
            }
        }
    }
}
