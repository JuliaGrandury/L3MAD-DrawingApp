//
//  LineView.swift
//  JuliaGrandury-Lab3
//
//  Created by Julia Grandury on 9/30/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import UIKit

class LineView: UIView {
    
    
    
    
    var currentStroke:UserStroke?{
        didSet{
            setNeedsDisplay()
        }
    }
    var strokesArray: [UserStroke] = [] {
        didSet{
            setNeedsDisplay()
        }
    }
    var storeForRedo:[UserStroke] = []
    var storeForReload:[UserStroke] = []

    
    
    
    
    //THING THAT HE KIND OF EXPLAINED NOT REALLY DO WE NEED THIS???
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    

    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        let xCoord = Double((first.x+second.x)/2.0)
        let yCoord = Double((first.y+second.y)/2.0)
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
    
    
    
    //pass an item from the user stroke array and then youll have userstroke.color or userstroke.weight
    // and then you just look up how to do .stroke or something so that it draws it
    //createQuadPath(points: currentPoints).stroke
    
    override func draw(_ rect: CGRect) {
        for stroke in strokesArray{
            let path = createQuadPath(points: stroke.pointsArray)
            stroke.lineColor.setStroke()
            path.lineCapStyle = .round
            path.lineJoinStyle = .round
            path.lineWidth = stroke.lineWidth!
            path.stroke()
        }
        if (currentStroke != nil){
            let path = createQuadPath(points: currentStroke!.pointsArray)
            currentStroke!.lineColor.setStroke()
            path.lineCapStyle = .round
            path.lineJoinStyle = .round
            path.lineWidth = (currentStroke?.lineWidth!)!
            path.stroke()
        }
    }
}
