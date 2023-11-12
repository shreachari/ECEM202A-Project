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
    
    // Necessary formatting functions
    static func formatText(_ originalText: String) -> String {
        // Format the original text here
        let formattedText = originalText.uppercased()
        return formattedText
            
    }
    
    static func connectAndCollectSensorData(text: Binding<String>) {
        //formatting
        text.wrappedValue = formatText("Sensor data goes here...\n\n")
        
        // comments on what actually needs to happen in this function
        // Start a 10 second countdown during which:
            // 1. Somehow perform ./runme on the Pi
            // 2. In setup, Pi should bind a socket to one of its ports. -- This goes on the Pi side
            // 3. Now here we need to open up a socket that connects to that socket on Raspberry Pi
        // Display animation of box exercise: https://lottiefiles.com/animations/box-breathing-4-4-4-c4UVvw8EaY
        // The Pi starts collecting data from sensor and send it here through that socket
        // We display that info over here.
        
    }
    
    static func appendSensorData(text: Binding<String>){
        text.wrappedValue.append("We can dynamically append new sensor data like this.")
    }
}
