//
//  ContentView.swift
//  Water Tracker
//
//  Created by shuruq alshammari on 21/04/1446 AH.
//

import SwiftUI

struct WaterTrackerPage1: View {
    @State private var bodyWeight: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // Water drop icon
            Image(systemName: "drop.fill") // Replace with your custom water drop image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(Color(red: 89/255, green: 171/255, blue: 224/255)) // اللون المخصص لقطرة الماء
            
            // Title text
            Text("Hydrate")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Description text
            Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            // Body weight input
            HStack {
                Text("Body weight")
                    .font(.headline)
                TextField("Value", text: $bodyWeight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad) // Ensures the user can input decimal values
            }
            .padding(.horizontal, 40)
            
            // Next Button
            Button(action: {
                // Action to move to the next page
            }) {
                Text("Next")
                    .font(.headline)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 89/255, green: 171/255, blue: 224/255)) // اللون المخصص لزر Next
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 40)
        }
        .padding(.top, 50)
    }
}

struct WaterTrackerPage1_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerPage1()
    }
}
