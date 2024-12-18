import SwiftUI

struct CarStatsView: View {
    let car: Car
    
    var body: some View {
        VStack {
            HStack {
                StatRow(label: "Attack", value: car.attack)
                StatRow(label: "Defense", value: car.defense)
            }
            
            HStack {
                StatRow(label: "Speed", value: car.speed)
                StatRow(label: "Handling", value: car.handling)
            }
        }
    }
}

struct StatRow: View {
    let label: String
    let value: Int
    
    var body: some View {
        HStack {
            Text(label)
            Image("bar\(value)")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
    }
}


