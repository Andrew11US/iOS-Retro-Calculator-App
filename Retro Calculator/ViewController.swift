//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Andrew Foster on 9/10/16.
//  Copyright © 2016 Foster Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }

    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    var player: AVAudioPlayer!
    
    // Variables
    var runningNumber = "0"
    var leftValStr = "0"
    var rightValStr = "0"
    var result = "0"
    var currentOperation: Operation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creting a AVAudioPlayer
        player = AudioService.instance.createPlayerWithUrl(audioUrl: AudioService.instance.btnUrl!)
        player?.prepareToPlay()
        
    }

    // Actions
    @IBAction func numberPressed(_ btn: UIButton!) {
        playSound()
        clearButton.isHidden = false
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
  
    @IBAction func onDividePressed(_ sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(_ sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(_ sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(_ sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(_ sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPressed(_ sender: AnyObject) {
        playSound()
        
        runningNumber = "0"
        leftValStr = "0"
        rightValStr = "0"
        outputLbl.text = "0"
        result = "0"
        currentOperation = Operation.Empty
        
    }
    
    func processOperation(_ op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            //Run some math
            
            // A user selected an operator, but then selected another operator without first entering a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                    
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            
            currentOperation = op
            
            
        } else {
            
            // This is the first time an operator has been pressed
            
            leftValStr = runningNumber
            runningNumber = "0"
            currentOperation = op
        }
    }
    
    func playSound() {
        
        if player.isPlaying {
            player.stop()
        }
        
        player.play()
    }
    
}

