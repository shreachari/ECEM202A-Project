//
//  ContentView.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 10/27/23.
//

import SwiftUI
import SwiftyZeroMQ

struct ContentView: View {
    @State private var receivedData: String = "No data received yet"
    let subscriptionFilter = ""

    var body: some View {
        Text("ZeroMQ Data: \(receivedData)")
            .onAppear {
                DispatchQueue.global(qos: .background).async {
                    do {
                        
                        // Create a ZeroMQ context
                        let context = try SwiftyZeroMQ.Context()

                        // Create a subscriber socket
                        let subscriber = try context.socket(.subscribe)

                        // Connect to the Raspberry Pi's publisher
                        try subscriber.connect("tcp://192.168.8.219:5555")  // Replace with the Raspberry Pi's IP address

                        // Subscribe to all messages
//                        try subscriber.setSubscribe(nil)
                        
                        
                        usleep(250)
                        

                        while true {
                            // Receive and process data
                            if let data = try subscriber.recv() {
                                print("HELLO")
                                DispatchQueue.main.async {
                                    // Update UI with received data
                                    print(data)
                                    self.receivedData = data
                                }
                            }
                        }
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}


//struct ContentView: View {
//    
//    @State private var text = "Sensor data goes here ..."
//    
//    var body: some View {
//        
//        VStack(alignment: .center) {
//            Text("Breathing Coach")
//                .font(.title)
//                .fontWeight(.heavy)
//                .foregroundColor(Color.orange)
//                .multilineTextAlignment(.leading)
//                .lineLimit(1)
//            
//            Button("Connect to Pi!") {
//                ContentViewHelper.connectAndCollectSensorData(text: $text)
//                ContentViewHelper.appendSensorData(text: $text)
//            }
//            
//            TextEditor(text: $text)
//                        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
//            
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
