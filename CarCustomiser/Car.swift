//
//  Car.swift
//  CarCustomiser
//
//  Created by Shanahan, Krystian (JD) on 16/01/2022.
//

import Foundation

struct Car {
    let make:String
    let model:String
    var topSpeed:Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return ("Make: \(self.make)\nModel: \(self.model)\nTop Speed:  \(self.topSpeed)mph\nAcceleration(0-60):  \(self.acceleration)s\nHandling: \(self.topSpeed)")
        
    }
}
