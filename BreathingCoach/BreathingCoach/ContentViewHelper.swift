//
//  ContentViewHelper.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 10/27/23.
//

import Foundation
import SwiftUI
import Starscream

class ContentViewHelper {
    // You can define functions and properties related to ContentView here
    
    static func connectAndCollectSensorData(text: Binding<String>) {
            text.wrappedValue = "We can dynamically print new sensor data from here."
        }
}
