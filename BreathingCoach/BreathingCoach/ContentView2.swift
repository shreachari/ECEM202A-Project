import SwiftUI
import Charts

class ChartData: ObservableObject {
    @Published var data: [Float]

    init(data: [Float]) {
        self.data = data
    }
}

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
    
    @State private var isStarted = false
    let zmqSubscriber = ZeroMQSubscriber(text: .constant(""))
    
    @ObservedObject var realTimeData: ChartData = ChartData(data: Array(repeating: 0.0, count: 20))
    @ObservedObject var expectedData: ChartData = ChartData(data: Array(repeating: 0.0, count: 20))
    
    var body: some View {
        ZStack{
            Color.mint.edgesIgnoringSafeArea(.all)
            
            if !isStarted {
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
                    
                    Button(action: {
                        zmqSubscriber.connectAndCollectSensorData()
                        self.isStarted = true
                    }) {
                        Text("Get Started!!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                }
                .padding()
            } else {
                VStack {
                    Text("Breathing Exercise")
                        .font(.title)
                    Chart(Array(realTimeData.data.enumerated()), id: \.0) { index, magnitude in
                        LineMark(
                            x: .value("Time", String(index)),
                            y: .value("Magnitude", magnitude)
                        )
                    }
                    .chartYScale(domain: [-0.001, 0.01])
                    .chartXAxis(.hidden)
                    .foregroundColor(.red)
                    .chartPlotStyle { plotArea in
                      plotArea.background(.white.opacity(0.4))
                    }
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                            let newDataPoint = zmqSubscriber.sensorValue
                            self.updateRealTimeData(dataToUpdate: realTimeData, with: newDataPoint)
                        }
                    }
                    
                    Text("Your Breathing Pattern")
                        .foregroundColor(.red)
                        .font(.body)
                                        
                    Chart(Array(expectedData.data.enumerated()), id: \.0) { index, magnitude in
                        LineMark(
                            x: .value("Time", String(index)),
                            y: .value("Magnitude", magnitude)
                        )
                    }
                    .chartYScale(domain: [-0.001, 0.01])
                    .chartXAxis(.hidden)
                    .foregroundColor(.blue)
                    .chartPlotStyle { plotArea in
                      plotArea.background(.white.opacity(0.4))
                    }
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                            let newDataPoint = Float.random(in: -0.001...0.01)
                            self.updateRealTimeData(dataToUpdate: expectedData, with: newDataPoint)
                        }
                    }
                    
                    Text("Goal Breathing Pattern")
                        .foregroundColor(.blue)
                        .font(.body)
                }

                .padding()
            }
        }
    }
    
    private func updateRealTimeData(dataToUpdate: ChartData, with newDataPoint: Float) {
        // Update the @Published property, triggering a refresh of the UI
        dataToUpdate.data.append(newDataPoint)

        if dataToUpdate.data.count > 20 {
            dataToUpdate.data.removeFirst()
        }
    }
}


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
