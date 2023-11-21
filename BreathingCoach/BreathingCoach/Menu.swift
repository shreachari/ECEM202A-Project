import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationView{
            
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Select an exercise")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.orange)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    
                    NavigationLink(destination: BoxBreathingHome()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44) // Adjust the height as needed
                                .foregroundColor(Color.yellow)
                            
                            Text("Box Breathing")
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

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
