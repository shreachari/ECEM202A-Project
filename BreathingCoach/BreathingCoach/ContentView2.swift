//
//  ContentView2.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 11/11/23.
//

import SwiftUI

struct ContentView2: View {
    
    var instructions = "Steps of this exercise: \n" +
        "1. Inhale for 4 seconds.\n" +
        "2. Hold for 4 seconds. \n" +
        "3. Exhale for 4 seconds. \n" +
        "4. Hold for 4 seconds. \n" +
    "- keep repeating for 2 minutes total.\n\n" +
    "Setup Instructions:\n" +
    "Sit straight and place the sensor device aligned to your chest at a 1 meter distance."
    
    @State private var sensorDataText = "Sensor data goes here...\n\n"
    let zmqSubscriber = ZeroMQSubscriber(text: .constant(""))
    
    var body: some View {
        ZStack{
            Color.mint.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Text("Box Breathing")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                //
                Text(instructions)
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                
                Button(action: {
                            // Action to be performed when the button is tapped
                            // You can add your code here
                    zmqSubscriber.connectAndCollectSensorData()
                    }) {
                        Text("Get Started!!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                
                
                TextEditor(text: $sensorDataText)
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .disabled(true) //non-editable
                
                Spacer()
            }
            .onAppear {
                // Set the binding for text in the subscriber
                zmqSubscriber.textBinding = $sensorDataText
            }
            .padding()
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
