//
//  Line.swift
//  JuliaGrandury-Lab3
//
//  Created by Julia Grandury on 9/30/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import Foundation
import UIKit

struct UserStroke {
    
    //STROKE STYLING
    var lineColor: UIColor
    var lineWidth: CGFloat?
    var lineOpacity: CGFloat?
    //STROKE VARIABLES
    var pointsArray: [CGPoint]
    var firstPoint: CGPoint
    
    //CONSTRUCTOR FOR STROKE
    init(lineColor: UIColor, lineWidth: CGFloat?, lineOpacity: CGFloat?, firstPoint: CGPoint) {
        self.lineColor = lineColor
        self.lineWidth = lineWidth
        self.lineOpacity = lineOpacity
        self.firstPoint = firstPoint
        self.pointsArray = []
    }
}
