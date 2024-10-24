//
//  Item.swift
//  Water Tracker
//
//  Created by shuruq alshammari on 21/04/1446 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
