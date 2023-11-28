import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationStack{
            
            ZStack{
                K.AppColors.appLightGreen.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Select an exercise")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(K.AppColors.appDarkGreen)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    NavigationLink(destination: BoxBreathingHome()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44) // Adjust the height as needed
                                .foregroundColor(K.AppColors.appDarkYellow)
                            
                            Text("Box Breathing")
                                .foregroundColor(K.AppColors.appDarkGreen)
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

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
