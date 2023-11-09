//
//  ContentView.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = "Sensor data goes here ..."
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Breathing Coach")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.orange)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            
            Button("Connect to Pi!") {
                ContentViewHelper.connectAndCollectSensorData(text: $text)
                ContentViewHelper.appendSensorData(text: $text)
            }
            
            TextEditor(text: $text)
                        .frame(minWidth: 200, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
