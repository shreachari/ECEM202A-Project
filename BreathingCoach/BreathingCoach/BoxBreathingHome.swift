import SwiftUI
import Charts

struct BoxBreathingHome: View {
    
    var instructions = "Steps of this exercise: \n\n" +
        "1. Inhale for 4 seconds.\n" +
        "2. Hold for 4 seconds. \n" +
        "3. Exhale for 4 seconds. \n" +
        "4. Hold for 4 seconds. \n" +
    "- keep repeating for 2 minutes total.\n\n" +
    "Setup Instructions:\n" +
    "Sit straight and place the sensor device aligned to your chest at a 1 meter distance."
    
    @State private var sensorDataText = "Sensor data goes here...\n\n"
    

    
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
                
                Text(instructions)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                
                NavigationLink(destination: BoxBreathing()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 44)
                            .foregroundColor(Color.yellow)
                        
                        Text("Start Exercise!")
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .bold()
                    }
                }
                .padding()
            }
        }
    }
}


struct BoxBreathingHome_Previews: PreviewProvider {
    static var previews: some View {
        BoxBreathingHome()
    }
}
