//
//  AudioService.swift
//  Retro Calculator
//
//  Created by Andrew Foster on 5/31/17.
//  Copyright © 2017 Foster Inc. All rights reserved.
//

import UIKit
import AVFoundation

class AudioService {
    
    static let instance = AudioService()
    
    private var _soundFXPlayer: AVAudioPlayer?
    
    var soundFXPlayer: AVAudioPlayer? {
        get {
            return _soundFXPlayer
        } set {
            _soundFXPlayer = newValue
        }
    }
    
    var btnUrl: URL? {
        
        if let urlStr = pathForResource(fileName: "btn", fileType: "wav") {
            return URL(fileURLWithPath: urlStr)
        }

        return nil
    }
    
    func pathForResource(fileName: String, fileType: String) -> String? {
        return Bundle.main.path(forResource: fileName, ofType: fileType)
    }
    
    func createPlayerWithUrl(audioUrl: URL) -> AVAudioPlayer? {
        do {
            return try AVAudioPlayer(contentsOf: audioUrl)
            
        } catch {
            return nil
        }
    }
    
    func playCurrentSoundFX() -> Bool {
        
        if let player = soundFXPlayer {
            
            if player.isPlaying {
                soundFXPlayer?.stop()
            }
            
            soundFXPlayer?.play()
            return player.isPlaying
        }
        return false
    }
    
}
