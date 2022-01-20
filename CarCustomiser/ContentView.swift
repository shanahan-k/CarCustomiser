//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Shanahan, Krystian (JD) on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar : Int = 0
    @State private var exhaustPackage = false
    @State private var tirePackage = false
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get : {self.exhaustPackage},
            set: {
            newValue in self.exhaustPackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].topSpeed += 5
                }
                else{
                    starterCars.cars[selectedCar].topSpeed -= 5
                    
                }
            }
        )
        let tirePackageBinding = Binding<Bool> (
            get : {self.tirePackage},
            set: {
                newVal in self.tirePackage = newVal
                if newVal {
                    starterCars.cars[selectedCar].handling += 2
                }
                else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )

        
        Form {
        VStack(spacing:20){
            Text(starterCars.cars[selectedCar].displayStats())
            .padding()
            Button("Next Car", action:{
                selectedCar = (selectedCar + 1) % self.starterCars.cars.count
            })
        }
            Section {
                Toggle("exhaust package" , isOn: exhaustPackageBinding)
                Toggle("Tires Package" , isOn : tirePackageBinding)
            }
            
            
        
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
