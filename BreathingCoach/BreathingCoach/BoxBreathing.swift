import SwiftUI
import Charts

class ChartData: ObservableObject {
    @Published var data: [Float]

    init(data: [Float]) {
        self.data = data
    }
}

struct BoxBreathing: View {
    @State private var countdown = 10
    @State private var breathingText = "Inhale"
    @State private var breathingVal = 1
    @State private var timer: Timer?
    @State private var isBreathing = false
    // CHANGE
    @State private var totalTime = 20
    @State private var showThankYou = false
    @State private var displayWaveforms = false
    
    let zmqSubscriber = ZeroMQSubscriber(text: .constant(""))
    @ObservedObject var realTimeData: ChartData = ChartData(data: Array(repeating: 0.0, count: 20))
    @ObservedObject var expectedData: ChartData = ChartData(data: Array(repeating: 0.0, count: 20))

    var body: some View {
        ZStack{
            Color.mint.edgesIgnoringSafeArea(.all)
            
            if countdown > 0 {
                Text("\(countdown)")
                    .font(.system(size: 108))
                    .bold()
                    .onAppear {
                        startCountdownTimer()
                    }
            } else if isBreathing && totalTime > 0 {
                VStack {
                    Text(breathingText)
                        .font(.title)
                        .fontWeight(.bold)
                        .onAppear {
                            startBreathingTimer()
                        }
                    if(!displayWaveforms) {
                        Button("Display Waveforms") {
                            displayWaveforms = true
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                    } else {
                        Button("Hide Waveforms") {
                            displayWaveforms = false
                        }
                        .padding()
                        .background(Color.black)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        
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
                }
                .padding()
            } else if showThankYou {
                VStack {
                    Text("You have completed the box breathing exercise. Good job!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    NavigationLink(destination: BoxBreathingHome()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44) // Adjust the height as needed
                                .foregroundColor(Color.yellow)
                            
                            Text("Return to Home")
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

    func startCountdownTimer() {
        zmqSubscriber.connectAndCollectSensorData()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 0 {
                countdown -= 1
            } else {
                timer.invalidate()
                isBreathing = true
            }
        }
    }

    func startBreathingTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            if totalTime > 0 {
                updateBreathingText()
                totalTime -= 4
            } else {
                timer.invalidate()
                showThankYou = true
            }
        }
    }

    func updateBreathingText() {
        switch breathingVal {
        case 1:
            breathingText = "Hold"
            breathingVal = 2
        case 2:
            breathingText = "Exhale"
            breathingVal = 3
        case 3:
            breathingText = "Hold"
            breathingVal = 4
        case 4:
            breathingText = "Inhale"
            breathingVal = 1
        default:
            break
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

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BoxBreathing()
    }
}
