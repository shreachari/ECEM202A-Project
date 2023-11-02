//
//  ContentView.swift
//  BreathingCoach
//
//  Created by Vaishnavi  manthena on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Breathing Coach")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.orange)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            
            Button("Connect to Pi!") {
                helper1()
            }
            
            TextEditor(text: .constant("Sensor data goes here ..."))
            
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
