//
//  CarViewModel.swift
//  streetfighter
//
//  Created by Cristian Scarano on 13/12/24.
//

import SwiftUI

struct Car: Identifiable {
    let id = UUID()
    var image: String
    var imageOn: String
    let name: String
    var attack: Int
    var defense: Int
    var speed: Int
    var handling: Int
    var lightsOn: Bool = false
    var engineSound: String
    var damageLevel: Int = 0
    var hitSounds: [String]
    var damagedImages: [String]
    var damagedImagesOn: [String]

}

class CarViewModel: ObservableObject {
    @Published var cars: [Car] = [
        Car(image: "evo", imageOn: "evo-on", name: "190E Evo II", attack: 1, defense: 4, speed: 3, handling: 2, engineSound: "engine", hitSounds: ["hit", "hit2"], damagedImages: ["evo_damage1", "evo_damage2", "evo_damage3"], damagedImagesOn: ["evo-on_damage1", "evo-on_damage2", "evo-on_damage3"]),
        Car(image: "integrale", imageOn: "integrale-on", name: "HF Integrale", attack: 4, defense: 5, speed: 3, handling: 5, engineSound: "integrale-2", hitSounds: ["hit", "hit2"], damagedImages: ["integrale_damage1", "integrale_damage2", "integrale_damage3"], damagedImagesOn: ["integrale-on_damage1", "integrale-on_damage2", "integrale-on_damage3"]),
        Car(image: "corvette", imageOn: "corvette-on", name: "Corvette C7.R", attack: 5, defense: 3, speed: 5, handling: 4, engineSound: "corvette", hitSounds: ["hit", "hit2"], damagedImages: ["corvette_damage1", "corvette_damage2", "corvette_damage3"], damagedImagesOn: ["corvette-on_damage1", "corvette-on_damage2", "corvette-on_damage3"]),
        Car(image: "mazda", imageOn: "mazda-on", name: "Mazda 787B", attack: 4, defense: 5, speed: 5, handling: 4, engineSound: "mazda", hitSounds: ["hit", "hit2"], damagedImages: ["mazda_damage1", "mazda_damage2", "mazda_damage3"], damagedImagesOn: ["mazda-on_damage1", "mazda-on_damage2", "mazda-on_damage3"]),
        Car(image: "audi", imageOn: "audi-on", name: "Audi Quattro", attack: 4, defense: 5, speed: 4, handling: 3, engineSound: "audi", hitSounds: ["hit", "hit2"], damagedImages: ["audi_damage1", "audi_damage2", "audi_damage3"], damagedImagesOn: ["audi-on_damage1", "audi-on_damage2", "audi-on_damage3"]),
    ]
    
    func applyDamage(at index: Int) {
        if cars[index].damageLevel == 3 {
            cars[index].damageLevel = 0
            return
        }
        
        cars[index].damageLevel += 1
        
        let randomSound = cars[index].hitSounds.randomElement() ?? cars[index].hitSounds[0]
        SoundManager.shared.playSound(
            named: randomSound,
            onlyWhenTurningOn: false
        )
    }
    
    func toggleCarLights(at index: Int) {
        let newState = !cars[index].lightsOn
        cars[index].lightsOn = newState
        print("Shake detected, playing sound")
        SoundManager.shared.playSound(
            named: cars[index].engineSound,
            onlyWhenTurningOn: true,
            isOn: newState
        )
    }
}
