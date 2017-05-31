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
    
    @IBOutlet weak var outputLbl: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    // Variables
    var runningNumber = "0"
    var leftValStr = "0"
    var rightValStr = "0"
    var result = "0"
    var currentOperation = CalcService.Operation.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creting a AVAudioPlayer
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(audioUrl: AudioService.instance.btnUrl!)
        AudioService.instance.soundFXPlayer?.prepareToPlay()
        
    }

    // Actions
    @IBAction func numberPressed(_ btn: UIButton!) {
        playSound()
        clearButton.isHidden = false
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
  
    @IBAction func onDividePressed(_ sender: AnyObject) {
        processOperation(CalcService.Operation.divide)
    }
    
    @IBAction func onMultiplyPressed(_ sender: AnyObject) {
        processOperation(CalcService.Operation.multiply)
    }
    
    @IBAction func onSubtractPressed(_ sender: AnyObject) {
        processOperation(CalcService.Operation.subtract)
    }
    
    @IBAction func onAddPressed(_ sender: AnyObject) {
        processOperation(CalcService.Operation.add)
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
        currentOperation = CalcService.Operation.empty
        
    }
    
    func processOperation(_ op: CalcService.Operation) {
        playSound()
        
        if currentOperation != CalcService.Operation.empty {
            //Run some math
            
            // A user selected an operator, but then selected another operator without first entering a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == CalcService.Operation.multiply {
                    result = CalcService.instance.multiply(numAstr: leftValStr, numBstr: rightValStr)!
                    
                } else if currentOperation == CalcService.Operation.divide {
                    result = CalcService.instance.divide(numAstr: leftValStr, numBstr: rightValStr)!
                    
                } else if currentOperation == CalcService.Operation.subtract {
                    result = CalcService.instance.subtract(numAstr: leftValStr, numBstr: rightValStr)!
                    
                } else if currentOperation == CalcService.Operation.add {
                    result = CalcService.instance.add(numAstr: leftValStr, numBstr: rightValStr)!
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
        AudioService.instance.playCurrentSoundFX()
    }
    
}

