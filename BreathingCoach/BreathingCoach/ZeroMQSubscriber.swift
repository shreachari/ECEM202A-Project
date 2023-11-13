//
//  ZeroMQSubscriber.swift
//  BreathingCoach
//
//  Created by Shrea Chari on 11/12/23.
//

import SwiftyZeroMQ
import SwiftUI

class ZeroMQSubscriber {

//    var socket: GCDAsyncSocket!
    var textBinding: Binding<String>

    init(text: Binding<String>) {
        self.textBinding = text
    }

    // Necessary formatting functions
    func formatText(_ originalText: String) -> String {
        // Format the original text here if needed
        let formattedText = originalText.uppercased()
        return formattedText
    }
    
    func connectAndCollectSensorData() {
        DispatchQueue.global(qos: .background).async {
            do {
                
                // Create a ZeroMQ context
                let context = try SwiftyZeroMQ.Context()
                
                // Create a subscriber socket
                let subscriber = try context.socket(.subscribe)
                
                // Connect to the Raspberry Pi's publisher
                //                        try subscriber.connect("tcp://192.168.8.219:5555")
                try subscriber.connect("tcp://127.0.0.1:12345")
                
                usleep(1000)
                
                // Subscribe to all messages
                try subscriber.setSubscribe(nil)
                
                
                usleep(250)
                
                
                while true {
                    print("true")
                    // Receive and process data
                    if let data = try subscriber.recv() {
                        usleep(250)
                        print("Recieved data.")
                        DispatchQueue.main.async {
                            // Update UI with received data
                            print(data)
                            self.textBinding.wrappedValue = self.formatText(data)
                        }
                    }
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

