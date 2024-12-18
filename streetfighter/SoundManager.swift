// Create new file SoundManager.swift
import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var audioPlayer: AVAudioPlayer?
    
    func playSound(named soundName: String, onlyWhenTurningOn: Bool = false, isOn: Bool = true) {
        // If we're only playing when turning on and the car is being turned off, return
        if onlyWhenTurningOn && !isOn {
            return
        }
        
        // Add print statement for debugging
        print("Attempting to play sound: \(soundName)")
        
        guard let path = Bundle.main.path(forResource: soundName, ofType: "mp3") else {
            print("Sound file not found: \(soundName).mp3")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("Sound started playing")
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
