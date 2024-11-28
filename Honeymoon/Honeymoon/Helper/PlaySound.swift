//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Oleh on 28.11.2024.
//

import AVFoundation
var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
}
