import SwiftUI
import Charts

class ChartData: ObservableObject {
    @Published var data: [Float]

    init(data: [Float]) {
        self.data = data
    }
}

struct BoxBreathing: View {
    @State private var countdown = 3
    @State var breathingCountdown = 4
    @State private var breathingText = "Inhale"
    @State private var breathingVal = 1
    @State private var timer: Timer?
    @State private var isBreathing = false
    @State private var expectedElement = 0
    @State private var totalTime = 120
    @State private var showThankYou = false
    @State private var displayWaveforms = true
    @State private var windowSize = 3
    
    let zmqSubscriber = ZeroMQSubscriber(text: .constant(""))
    @ObservedObject var realTimeData: ChartData = ChartData(data: Array(repeating: 0.0, count: 50))
    @ObservedObject var expectedData: ChartData = ChartData(data: Array(repeating: 0.0, count: 50))
    @State private var yAxisDomain: ClosedRange<Double> = -0.001...0.01
    
    // update
    private var hold_threshold = 0.0025
    private var inhale_slope = 0.0025
    private var exhale_slope = -0.00015
    private var slope_var_per = 0.75

    var body: some View {
        ZStack{
            K.AppColors.appLightYellow.edgesIgnoringSafeArea(.all)
            
            if countdown > 0 {
                Text("\(countdown)")
                    .font(.system(size: 108))
                    .foregroundColor(K.AppColors.appDarkBlue)
                    .bold()
                    .onAppear {
                        startInitialCountdownTimer()
                    }
            } else if isBreathing && totalTime > 0 {
                VStack {
                    HStack{
                        Text("\(breathingText) \(breathingCountdown)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(K.AppColors.appDarkBlue)
                            .onAppear {
                                startBreathingTimer()
                                startCountdownTimer()
                                startErrorCheckTimer()
                            }
                    }
                    if(!displayWaveforms) {
                        Button("Display Waveforms") {
                            displayWaveforms = true
                        }
                        .padding()
                        .background(K.AppColors.appLightBlue)
                        .fontWeight(.bold)
                        .cornerRadius(40)
                        .foregroundColor(K.AppColors.appDarkBlue)
                    } else {
                        Button("Hide Waveforms") {
                            displayWaveforms = false
                        }
                        .padding()
                        .background(K.AppColors.appLightBlue)
                        .fontWeight(.bold)
                        .cornerRadius(40)
                        .foregroundColor(K.AppColors.appDarkBlue)
                        
                        Chart(Array(realTimeData.data.enumerated()), id: \.0) { index, magnitude in
                            LineMark(
                                x: .value("Time", String(index)),
                                y: .value("Magnitude", magnitude)
                            )
                        }
                        .chartYScale(domain: yAxisDomain)
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
                        .chartYScale(domain: [0, 201])
                        .chartXAxis(.hidden)
                        .foregroundColor(.blue)
                        .chartPlotStyle { plotArea in
                            plotArea.background(.white.opacity(0.4))
                        }
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                                let newDataPoint = (self.expectedElement >= ExpectedBreathing.Box.count) ? Float(0.0): ExpectedBreathing.Box[expectedElement]
                                self.expectedElement += 1
                                self.updateExpectedData(dataToUpdate: expectedData, with: newDataPoint)
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
                        .foregroundColor(K.AppColors.appDarkBlue)
                    
                    NavigationLink(destination: Menu()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 44) // Adjust the height as needed
                                .foregroundColor(K.AppColors.appDarkYellow)
                            
                            Text("Return to Menu")
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

    func startInitialCountdownTimer() {
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
                zmqSubscriber.disconnectFromSensor()
                showThankYou = true
            }
        }
    }
    
    func startCountdownTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.breathingCountdown > 1 {
                    self.breathingCountdown -= 1
                } else {
                    self.breathingCountdown = 4
                }
                
                if totalTime < 0 {
                    timer.invalidate()
                }
            }
        }

    func startErrorCheckTimer() {
        var initial = Float(0)
        var final = Float(0)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.breathingCountdown == 3 {
                initial = realTimeData.data.last ?? Float(0)
            }
            if self.breathingCountdown == 1 {
                final = realTimeData.data.last ?? Float(0)
                checkData(initial: Double(initial), final: Double(final), step: breathingVal)
            }
            
            if totalTime < 0 {
                timer.invalidate()
            }
        }
    }
    
    func checkData(initial: Double, final: Double, step: Int){
        let slope = (final - initial)/20
        switch breathingVal {
        case 1:
            //inhale (check slope)
            if abs(slope - inhale_slope) > abs(slope_var_per * inhale_slope) {
                if slope < inhale_slope {
                    print("please inhale more deeply")
                }else {
                    print("please slow down inhale")
                }
            }
        case 3:
            //exhale (check slope)
            if abs(slope - exhale_slope) > abs(slope_var_per * exhale_slope) {
                if slope > exhale_slope {
                    print("please exhale more deeply")
                }else {
                    print("please slow down exhale")
                }
            }
        case 2:
            //hold
            fallthrough
        case 4:
            //hold (check threshold)
            if abs(final - initial) > hold_threshold {
                print("please hold breathing")
            }
        default:
            break
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
        var movingAvg = newDataPoint
        
        if dataToUpdate.data[dataToUpdate.data.count-windowSize] != Float(0) {
            var data: [Float] = dataToUpdate.data.suffix(windowSize-1)
            data.append(newDataPoint)
            movingAvg = calculateMovingAverage(data: data, windowSize: windowSize)
        }
        dataToUpdate.data.append(movingAvg)
        
        if dataToUpdate.data.count > 50 {
            dataToUpdate.data.removeFirst()
        }
        
        // Update yAxisDomain based on your real-time data
        if Double(newDataPoint) > yAxisDomain.upperBound {
            let minY = yAxisDomain.lowerBound
            let maxY = Double(newDataPoint)
            yAxisDomain = minY...maxY + 0.001 // Adjust for padding
        } else if Double(newDataPoint) < yAxisDomain.lowerBound {
            let minY = Double(newDataPoint)
            let maxY = yAxisDomain.upperBound
            yAxisDomain = minY - 0.001...maxY // Adjust for padding
        }

    }
    
    private func calculateMovingAverage(data: [Float], windowSize: Int) -> Float {
        let sum = data.reduce(0, +)
        let average = sum / Float(windowSize)
        return average
    }
    
    private func updateExpectedData(dataToUpdate: ChartData, with newDataPoint: Float){
        
        // Update the @Published property, triggering a refresh of the UI
        dataToUpdate.data.append(newDataPoint)

        if dataToUpdate.data.count > 50 {
            dataToUpdate.data.removeFirst()
        }
        
    }
}

struct BreathingView_Previews: PreviewProvider {
    static var previews: some View {
        BoxBreathing()
    }
}
