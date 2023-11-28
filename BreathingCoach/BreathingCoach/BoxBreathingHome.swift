import SwiftUI
import Charts

struct BoxBreathingHome: View {
    
    var instructions = "Steps of this exercise: \n\n" +
        "1. Inhale for 4 seconds.\n" +
        "2. Hold for 4 seconds. \n" +
        "3. Exhale for 4 seconds. \n" +
        "4. Hold for 4 seconds. \n\n" +
    "Repeat for 2 minutes.\n\n" +
    "Setup Instructions:\n" +
    "Sit up straight and align the sensor to your chest at a 1 meter distance."

    
    var body: some View {
        ZStack{
            K.AppColors.appLightBlue.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Text("Box Breathing")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(K.AppColors.appDarkBlue)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                Text(instructions)
                    .font(.headline)
                    .foregroundColor(K.AppColors.appDarkBlue)
                    .padding()
                
                NavigationLink(destination: BoxBreathing()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 44)
                            .foregroundColor(K.AppColors.appDarkYellow)
                        
                        Text("Start Exercise!")
                            .foregroundColor(K.AppColors.appDarkBlue)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .bold()
                    }
                }
                .padding()
                
                NavigationLink(destination: Menu()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 44)
                            .foregroundColor(K.AppColors.appLightYellow)
                        
                        Text("Back To Menu")
                            .foregroundColor(K.AppColors.appDarkBlue)
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
