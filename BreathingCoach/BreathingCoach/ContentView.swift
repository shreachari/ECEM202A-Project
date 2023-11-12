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
