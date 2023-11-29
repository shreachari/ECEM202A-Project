import SwiftUI
import SwiftyZeroMQ

struct HomePage: View {
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                K.AppColors.appLightYellow.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Breathing Coach")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(K.AppColors.appDarkBlue)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    //Image
                    Image("Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 450)
                    
                    
                    NavigationLink(destination: Menu()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44) // Adjust the height as needed
                                .foregroundColor(K.AppColors.appDarkYellow)
                            
                            Text("Get Started")
                                .foregroundColor(K.AppColors.appDarkBlue)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
