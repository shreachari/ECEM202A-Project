//
//  ContentView.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 10/27/23.
//

import SwiftUI
import SwiftyZeroMQ

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color.indigo.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Breathing Coach")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    //Image
                    Image("Meditation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 450)
                    
                    
                    NavigationLink(destination: ContentView2()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44) // Adjust the height as needed
                                .foregroundColor(Color.yellow)
                            
                            Text("GET STARTED!")
                                .foregroundColor(Color.black)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .bold()
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}


//@State private var receivedData: String = "No data received yet"
//let subscriptionFilter = ""
//
//var body: some View {
//    Text("ZeroMQ Data: \(receivedData)")
//        .onAppear {
//            DispatchQueue.global(qos: .background).async {
//                do {
//                    
//                    // Create a ZeroMQ context
//                    let context = try SwiftyZeroMQ.Context()
//
//                    // Create a subscriber socket
//                    let subscriber = try context.socket(.subscribe)
//
//                    // Connect to the Raspberry Pi's publisher
////                        try subscriber.connect("tcp://192.168.8.219:5555")
//                    try subscriber.connect("tcp://127.0.0.1:5555")
//
//                    usleep(1000)
//                    
//                    // Subscribe to all messages
//                    try subscriber.setSubscribe(nil)
//                    
//                    
//                    usleep(250)
//                    
//
//                    while true {
//                        print("true")
//                        // Receive and process data
//                        if let data = try subscriber.recv(options: .dontWait) {
//                            print("Recieved data.")
//                            DispatchQueue.main.async {
//                                // Update UI with received data
//                                print(data)
//                                self.receivedData = data
//                            }
//                        }
//                    }
//                } catch {
//                    print("error")
//                    print("Error: \(error)")
//                }
//            }
//        }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
