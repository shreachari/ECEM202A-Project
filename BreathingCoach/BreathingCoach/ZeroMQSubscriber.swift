import SwiftyZeroMQ
import SwiftUI

class ZeroMQSubscriber {

    var textBinding: Binding<String>
    var sensorValue: Float
    var context: SwiftyZeroMQ.Context
    var subscriber: SwiftyZeroMQ.Socket
    var runningSession: Bool

    init(text: Binding<String>) {
        self.textBinding = text
        sensorValue = 0.0
        runningSession = true
        do{
            self.context = try SwiftyZeroMQ.Context()
            self.subscriber = try context.socket(.subscribe)
        }catch{
            fatalError("Failed to initialize ZeroMQ context and socket: \(error)")
        }
    }

    
    func connectAndCollectSensorData() {
        DispatchQueue.global(qos: .background).async {
            do {
                //let context = try SwiftyZeroMQ.Context()
                //let subscriber = try context.socket(.subscribe)
                try self.subscriber.connect("tcp://192.168.8.219:5555")
                
                usleep(1000)
                
                try self.subscriber.setSubscribe(nil)
                
                usleep(250)
                
                
                while self.runningSession {
                    if let data = try self.subscriber.recv() {
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
    
    func disconnectFromSensor(){
        do{
            self.runningSession = false
            try self.subscriber.close()
            try self.context.close()
            print("Closing context and socket")
        } catch {
            fatalError("Failed to close ZeroMQ context and socket: \(error)")
        }
    }
}

