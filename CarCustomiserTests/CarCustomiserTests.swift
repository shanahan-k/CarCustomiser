//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Shanahan, Krystian (JD) on 16/01/2022.
//

import XCTest


class CarCustomiserTests: XCTestCase {
    
    func testnewCarGivesMeACarWithAllAttributesSet() {
        //arange
        let car = Car(make:"Mazda",model:"mx5",topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make,"Mazda")
        XCTAssertEqual(car.model,"mx5")
        XCTAssertEqual(car.topSpeed,125)
        XCTAssertEqual(car.acceleration,7.7)
        XCTAssertEqual(car.handling,5)
        
        
    }
    func testDisplayStatsCorrect() {
        //arrange
        let car = Car(make:"Mazda",model:"mx5",topSpeed: 125, acceleration: 7.7, handling: 5)
        let outputText = car.displayStats()
        XCTAssertEqual(("Make: \(car.make)\nModel: \(car.model)\nTop Speed:  \(car.topSpeed)mph\nAcceleration(0-60):  \(car.acceleration)s\nHandling: \(car.topSpeed)"), outputText)
    }

}
