//
//  LineView.swift
//  JuliaGrandury-Lab3
//
//  Created by Julia Grandury on 9/30/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import UIKit

class LineView2: UIView{
    
    var theLine:Line?{
        didSet{
            setNeedsDisplay()
        }
    }
    var lines: [Line] = [] {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let xCoord = (first.x+second.x)/2
        let yCoord = (first.y+second.y)/2
        let midpoint = CGPoint(x: xCoord, y: yCoord)
        return midpoint
    }
    
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath() //Create the path object
        if(points.count < 2){ //There are no points to add to this path
            return path }
        path.move(to: points[0]) //Start the path on the first point
        for i in 1..<points.count - 1{
            let firstMidpoint = midpoint(first: path.currentPoint, second:
                points[i]) //Get midpoint between the path's last point and the next one in the array
            let secondMidpoint = midpoint(first: points[i], second:
                points[i+1]) //Get midpoint between the next point in the array and the one after it
            path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,
                          controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
        }
        return path
    }
    

    
    
}
