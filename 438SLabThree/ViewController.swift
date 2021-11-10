//
//  ViewController.swift
//  JuliaGrandury-Lab3
//
//  Created by Julia Grandury on 9/28/19.
//  Copyright © 2019 Julia Grandury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var widthSlider: UISlider!
    
//    @IBOutlet weak var redButt: UIToolbar!
//    @IBOutlet weak var orangeButt: UIBarButtonItem!
//    @IBOutlet weak var yellowButt: UIBarButtonItem!
//    @IBOutlet weak var greenButt: UIToolbar!
//    @IBOutlet weak var blueButt: UIBarButtonItem!
    
    
    @IBOutlet weak var lineCanvas: LineView!
    
    var currentStroke: UserStroke?
    //var lineCanvas: LineView?
    var chosenColor: UIColor = .clear
    
    
//    @IBAction func oSliderValue(_ sender: Any) {
//        currentStroke?.lineOpacity = CGFloat(opacitySlider.value)
//    }
//    @IBAction func tSliderValue(_ sender: Any) {
//        currentStroke?.lineWidth = CGFloat(widthSlider.value)
//    }
    @IBAction func choseRed(_ sender: Any) {
        chosenColor = .red
    }
    @IBAction func choseOrange(_ sender: Any) {
        chosenColor = .orange
    }
    @IBAction func choseYellow(_ sender: Any) {
        chosenColor = .yellow
    }
    @IBAction func choseGreen(_ sender: Any) {
        chosenColor = .green
    }
    @IBAction func choseBlue(_ sender: Any) {
        chosenColor = .blue
    }
    
    
    
    //array for storing for the undo/redo
    @IBAction func clearScreen(_ sender: Any) {
        lineCanvas!.currentStroke = nil
        lineCanvas!.strokesArray = []
    }
    @IBAction func undoLast(_ sender: Any) {
        if (lineCanvas!.strokesArray.count>0){
            lineCanvas.storeForRedo.append(lineCanvas.strokesArray.last!)
            lineCanvas.strokesArray.removeLast()
            currentStroke = nil
        }
        else{
        }
    }
    @IBAction func redoLast(_ sender: Any) {
        if (lineCanvas.storeForRedo.count>0){
            lineCanvas.strokesArray.append(lineCanvas.storeForRedo.last!)
            lineCanvas.storeForRedo.removeLast()
        }
    }
    @IBAction func saveAll(_ sender: Any) {
        lineCanvas.storeForReload = lineCanvas.strokesArray
    }
    @IBAction func reloadAll(_ sender: Any) {
        lineCanvas.strokesArray = lineCanvas.storeForReload
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //lineCanvas = LineView(frame: view.frame)
        //view.addSubview(lineCanvas!) //adds a subview for when drawing lineCanvas
        //[self.view.sendSubviewToBack(lineCanvas!)] //sends the subview to the back
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: lineCanvas) as CGPoint
        //this should be where it records color, width and opacity of the current stroke
        let appearance = chosenColor.withAlphaComponent(CGFloat(opacitySlider!.value))
        //chosenColor = appearance
        currentStroke = UserStroke(lineColor: appearance, lineWidth: CGFloat(widthSlider.value), lineOpacity: CGFloat(opacitySlider.value), firstPoint: touchPoint)
        currentStroke!.pointsArray.append(touchPoint)
        lineCanvas?.currentStroke = currentStroke
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: lineCanvas) as CGPoint
        currentStroke!.pointsArray.append(touchPoint)
        lineCanvas?.currentStroke = currentStroke
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lineCanvas!.strokesArray.append(currentStroke!)
        lineCanvas?.currentStroke = nil
    }
}

