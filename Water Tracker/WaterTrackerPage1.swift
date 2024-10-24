//
//  ContentView.swift
//  Water Tracker
//
//  Created by shuruq alshammari on 21/04/1446 AH.
//
import SwiftUI

// وظيفة لتحويل HEX إلى Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // يتخطى علامة #
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct WaterTrackerPage1: View {
    @State private var bodyWeight: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                // Water drop icon مع لون #32ADE6
                Image(systemName: "drop.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(hex: "32ADE6")) // استخدام لون #32ADE6 للقطرة
                    .position(x: 50, y: 250)
                
                Text("Hydrate")
                    .font(.system(size: 25, weight: .bold))
                    .position(x: 63, y: 320)
                
                // Description text
                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .font(.body)
                    .foregroundColor(Color(hex: "636366")) // تحديد لون النص باستخدام كود HEX
                    .multilineTextAlignment(.leading)
                    .frame(width: 350)
                    .position(x: 180, y: 400)
                
                // Body weight input with sharp corners
                HStack {
                    Text("Body weight")
                        .font(.body)
                    
                    TextField("Value", text: $bodyWeight)
                        .padding(10)
                        .background(Color(hex: "F2F2F7"))
                        .cornerRadius(0)
                        .keyboardType(.decimalPad)
                        .frame(height: 50)
                    
                    // زر الـ X كعنصر مستقل
                    if !bodyWeight.isEmpty {
                        Button(action: {
                            bodyWeight = "" // يمسح النص
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .foregroundColor(Color.gray)
                                .frame(width: 20, height: 20) // تحديد حجم الزر
                        }
                       
                    }
                }
                .padding(.horizontal)
                .frame(width: 355, height: 44)
                .background(Color(hex: "F2F2F7"))
                .cornerRadius(0)
                .position(x: 190, y: 490)
                
                // Next Button
                NavigationLink(destination: WaterTrackerPage2()) {
                    Text("Next")
                        .font(.headline)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "32ADE6"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(width: 355, height: 50)
                }
                .position(x: 200, y: 800)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}



struct WaterTrackerPage1_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerPage1()
    }
}
