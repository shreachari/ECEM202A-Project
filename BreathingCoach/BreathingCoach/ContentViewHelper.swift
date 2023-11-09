//
//  ContentViewHelper.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 10/27/23.
//

import Foundation
import SwiftUI

class ContentViewHelper {
    // You can define functions and properties related to ContentView here
    
    static func formatText(_ originalText: String) -> String {
        // Format the original text here
        let formattedText = originalText.uppercased()
        return formattedText
            
    }
    
    static func connectAndCollectSensorData(text: Binding<String>) {
            //formatting
            text.wrappedValue = formatText("We can dynamically print new sensor data from here.\n")
        }
    
    static func appendSensorData(text: Binding<String>){
        text.wrappedValue.append("We can dynamically append new sensor data like this.")
    }
}
