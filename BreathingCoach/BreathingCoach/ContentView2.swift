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
    let zmqSubscriber = ZeroMQSubscriber(text: .constant(""))
    
    @ObservedObject var chartData: ChartData = ChartData(data: Array(repeating: 0.0, count: 20))
    
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
                
                Button(action: {
                    zmqSubscriber.connectAndCollectSensorData()
                    }) {
                        Text("Get Started!!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                VStack {
                    Chart(Array(chartData.data.enumerated()), id: \.0) { index, magnitude in
                        LineMark(
                            x: .value("Time", String(index)),
                            y: .value("Magnitude", magnitude)
                        )
                    }
                    .chartYScale(domain: [-0.001, 0.01])
                }
                .onAppear {
                    // Simulate updating data at regular intervals
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                        let newDataPoint = zmqSubscriber.sensorValue
                        print(newDataPoint)
                        self.updateChartData(with: newDataPoint)
                    }
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
    
    private func updateChartData(with newDataPoint: Float) {
        // Update the @Published property, triggering a refresh of the UI
        chartData.data.append(newDataPoint)

        // Limit the number of data points to keep the graph from growing indefinitely
        if chartData.data.count > 20 {
            chartData.data.removeFirst()
        }
    }
}


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
