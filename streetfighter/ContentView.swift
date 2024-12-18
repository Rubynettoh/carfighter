//
//  ContentView.swift
//  streetfighter
//
//  Created by Cristian Scarano on 13/12/24.
//

// Add these imports at the top of the file
import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var carViewModel = CarViewModel()
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack {
            Image("background")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack {
                
                Image("carfighter")
                    .resizable()
                    .frame(width: 350, height: 230)
                    .padding(.top, 60)
                
                TabView(selection: $selectedIndex) {
                    ForEach(carViewModel.cars.indices, id: \.self) { index in
                        CarCardView(
                            car: carViewModel.cars[index],
                            onTap: {
                                // Call applyDamage when car is tapped
                                carViewModel.applyDamage(at: index)
                            }
                        )
                        .tag(index)
                    }
                }
                .onShake {
                    carViewModel.toggleCarLights(at: selectedIndex)
                }
                .tabViewStyle(.page)
            }
        }
    }
}

#Preview {
    ContentView()
}

// End of file. No additional code.
