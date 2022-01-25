//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Shanahan, Krystian (JD) on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var remainingFunds = 1000
    @State private var starterCars = StarterCars()
    @State private var selectedCar : Int = 0
    @State private var exhaustPackage = false
    @State private var tirePackage = false
    @State private var driveTrainPackage = false
    @State private var ecuFuelPackage = false
    
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true :  remainingFunds >= 500 ? true : false
    }
    
    var tiresPackageEnabled: Bool {
        return tirePackage ? true : remainingFunds >= 500 ? true : false
    }
    
    
    var ecuFuelPackageEnabled: Bool {
        return ecuFuelPackage ? true : remainingFunds >= 1000 ? true : false
    }
    
    var driveTrainPackageEnabled:Bool  {
        return driveTrainPackage ? true : remainingFunds >= 500 ? true : false
    }
    
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
                newValue in self.tirePackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].handling += 2
                }
                else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        let ecuFuelPackageBinding = Binding<Bool> (
            get : {self.ecuFuelPackage},
            set: {
            newValue in self.ecuFuelPackage = newValue
                if newValue {
                    starterCars.cars[selectedCar].acceleration -= 0.5
                }
                else{
                    starterCars.cars[selectedCar].acceleration += 0.5
                    
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
                Toggle("exhaust package($500)" , isOn: exhaustPackageBinding)
                Toggle("Tires Package($500)" , isOn : tirePackageBinding)
                Toggle("ECU & fuel package ($1000)" , isOn: ecuFuelPackageBinding )
            }
            
            
        
        
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
