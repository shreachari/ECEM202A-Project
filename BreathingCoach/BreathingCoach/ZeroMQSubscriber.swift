import SwiftyZeroMQ
import SwiftUI

class ZeroMQSubscriber {

    var textBinding: Binding<String>
    var sensorValue: Float

    init(text: Binding<String>) {
        self.textBinding = text
        sensorValue = 0.0
    }

    
    func connectAndCollectSensorData() {
        DispatchQueue.global(qos: .background).async {
            do {
                
                let context = try SwiftyZeroMQ.Context()
                let subscriber = try context.socket(.subscribe)
                try subscriber.connect("tcp://192.168.8.219:5555")
                
                usleep(1000)
                
                try subscriber.setSubscribe(nil)
                
                usleep(250)
                
                
                while true {
                    if let data = try subscriber.recv() {
                        usleep(250)
                        DispatchQueue.main.async {
                            self.sensorValue = (data as NSString).floatValue
                            self.textBinding.wrappedValue = data
                        }
                    }
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

