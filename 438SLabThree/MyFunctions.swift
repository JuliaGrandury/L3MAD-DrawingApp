//
//  MyFunctions.swift
//  JuliaGrandury-Lab3
//
//  Created by Julia Grandury on 10/2/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import Foundation
import UIKit

class MyFunctions{
    //he made his a static func
    static func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let xCoord = (first.x+second.x)/2
        let yCoord = (first.y+second.y)/2
        let midpoint = CGPoint(x: xCoord, y: yCoord)
        return midpoint
    }

    
}
