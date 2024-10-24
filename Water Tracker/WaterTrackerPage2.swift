//
//  WaterTrackerPage1.swift
//  Water Tracker
//
//  Created by shuruq alshammari on 21/04/1446 AH.
//


import SwiftUI

struct WaterTrackerPage2: View {
    @State private var startHour: Date = Date() // لتحديد الساعة
    @State private var endHour: Date = Date() // لتحديد نهاية الساعة
    @State private var isAMStart = true
    @State private var isAMEnd = true
    @State private var selectedInterval: Int = 15 // الفاصل الزمني المحدد
    let intervals = [15, 30, 60, 90, 120, 180, 240, 300] // الفواصل الزمنية
    
    var body: some View {
        ZStack {
            // العنوان الرئيسي
            Text("Notification Preferences")
                .font(.system(size: 25, weight: .bold))
                .fontWeight(.bold)
                .position(x: 160, y: 90) // تحديد الموقع يدوياً
            
            // العنوان الفرعي "The start and End hour"
            Text("The start and End hour")
                .font(.system(size: 20, weight: .semibold))
                .position(x: 125, y: 150) // تحديد الموقع يدوياً
            
            // الوصف تحت العنوان الفرعي
            Text("Specify the start and end date to receive the notifications")
                .font(.body)
                .foregroundColor(Color(hex: "636366")) // تحديد لون النص باستخدام كود HEX
                .multilineTextAlignment(.leading)
                .frame(width: 350)
                .position(x: 190, y: 195) // تحديد الموقع يدوياً
            
            // اختيار وقت البداية
            HStack {
                Text("Start hour")
                    .frame(width: 100, alignment: .leading)
                Spacer()
                DatePicker("", selection: $startHour, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                HStack {
                    Button(action: {
                        isAMStart = true
                    }) {
                        Text("AM")
                            .frame(width: 40, height: 30)
                            .background(isAMStart ? Color.white : Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                    Button(action: {
                        isAMStart = false
                    }) {
                        Text("PM")
                            .frame(width: 40, height: 30)
                            .background(isAMStart ? Color.gray.opacity(0.2) : Color.white)
                            .cornerRadius(5)
                    }
                }
            }
            .padding()
            .background(Color(hex: "F2F2F7"))
            .cornerRadius(10)
            .frame(width: 350)
            .position(x: 200, y: 240) // تحديد الموقع يدوياً
            
            // اختيار وقت النهاية
            HStack {
                Text("End hour")
                    .frame(width: 100, alignment: .leading)
                Spacer()
                DatePicker("", selection: $endHour, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                HStack {
                    Button(action: {
                        isAMEnd = true
                    }) {
                        Text("AM")
                            .frame(width: 40, height: 30)
                            .background(isAMEnd ? Color.white : Color.gray.opacity(0.2))
                            .cornerRadius(5)
                    }
                    Button(action: {
                        isAMEnd = false
                    }) {
                        Text("PM")
                            .frame(width: 40, height: 30)
                            .background(isAMEnd ? Color.gray.opacity(0.2) : Color.white)
                            .cornerRadius(5)
                    }
                }
            }
            .padding()
            .background(Color(hex: "F2F2F7"))
            .cornerRadius(10)
            .frame(width: 350)
            .position(x: 200, y: 320) // تحديد الموقع يدوياً
            
            // قسم اختيار الفاصل الزمني
            Text("Notification interval")
                .font(.headline)
                .position(x: 160, y: 380) // تحديد الموقع يدوياً
            
            Text("How often would you like to receive notifications within the specified time interval")
                .font(.subheadline)
                .foregroundColor(.gray)
                .position(x: 160, y: 410) // تحديد الموقع يدوياً
            
            // أزرار اختيار الفاصل الزمني
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                ForEach(intervals, id: \.self) { interval in
                    Button(action: {
                        selectedInterval = interval
                    }) {
                        VStack {
                            Text("\(interval) \(interval < 120 ? "Mins" : "Hours")")
                                .font(.headline)
                                .foregroundColor(selectedInterval == interval ? .white : Color.blue)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 80, height: 80) // الأزرار مربعة الشكل
                        .background(selectedInterval == interval ? Color.blue : Color(hex: "F2F2F7"))
                        .cornerRadius(10)
                    }
                }
            }
            .frame(width: 350, height: 200) // تحديد الحجم يدوياً
            .position(x: 200, y: 500) // تحديد الموقع يدوياً
            
            // زر البدء
            Button(action: {
                // تنفيذ العملية بعد اختيار الإعدادات
            }) {
                Text("Start")
                    .font(.headline)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "32ADE6"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .frame(width: 355, height: 50)
            }
            .position(x: 200, y: 700) // تحديد الموقع يدوياً
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WaterTrackerPage2_Previews: PreviewProvider {
    static var previews: some View {
        WaterTrackerPage2()
    }
}
