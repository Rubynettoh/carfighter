import SwiftUI

struct CarCardView: View {
    // Takes a Car model as input
    let car: Car
    var onTap: () -> Void  // Add tap handler
    
    // Helper function to get the correct damage image
    private func getDamagedImage() -> String {
        if car.damageLevel == 0 {
            return car.lightsOn ? car.imageOn : car.image
        } else {
            let damageIndex = car.damageLevel - 1
            return car.lightsOn ?
                car.damagedImagesOn[damageIndex] :
                car.damagedImages[damageIndex]
        }
    }
    
    var body: some View {
        VStack {
            // Special case for Mazda car
            if car.image == "mazda" {
                
                ZStack {
                    // Dynamic image based on lights state and damage level
                    Image(getDamagedImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .onTapGesture { onTap() }  // Add tap gesture
                    
                    // Car name with custom styling
                    Text(car.name)
                        .font(.custom("04b30", size: 30))
                        .foregroundStyle(
                            LinearGradient(colors: [.yellow, .orange, .red],
                                         startPoint: .topLeading,
                                         endPoint: .bottomLeading)
                        )
                        .padding(.top, 300)
                }
                
            }
            // Add special case for Lancia
            else if car.image == "integrale" {
                ZStack {
                    // Dynamic image selection based on lights state and damage level
                    Image(getDamagedImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 400)
                        .padding(.top, -50)
                        .onTapGesture { onTap() }  // Add tap gesture
                    
                    // Car name with custom styling
                    Text(car.name)
                        .font(.custom("04b30", size: 30))
                        .foregroundStyle(
                            LinearGradient(colors: [.yellow, .orange, .red],
                                         startPoint: .topLeading,
                                         endPoint: .bottomLeading)
                        )
                        .padding(.top, 350)
                }
            } else {
                // Standard layout for other cars
                VStack {
                    Image(getDamagedImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .onTapGesture { onTap() }  // Add tap gesture
                    
                    Text(car.name)
                        .font(.custom("04b30", size: 30))
                        .foregroundStyle(
                            LinearGradient(colors: [.yellow, .orange, .red],
                                         startPoint: .topLeading,
                                         endPoint: .bottomLeading)
                        )
                }
            }
            
            // Stats view component
            CarStatsView(car: car)
        }
        // Global styling for the card
        .font(.custom("04b30", size: 20))
        .foregroundStyle(
            LinearGradient(colors: [.yellow, .orange, .red],
                         startPoint: .topLeading,
                         endPoint: .bottomLeading)
        )
        .padding(.bottom, 110)
    }
}
