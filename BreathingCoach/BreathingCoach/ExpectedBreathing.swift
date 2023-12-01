import Foundation

struct ExpectedBreathing{
    public static let Box: [Float] = [5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.0025, 10.002500000000001, 15.002500000000001, 20.0025, 25.0025, 30.0025, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 190.0025, 185.0025, 180.0025, 175.0025, 170.0025, 165.0025, 160.0025, 155.0025, 150.0025, 145.0025, 140.0025, 135.0025, 130.0025, 125.0025, 120.0025, 115.0025, 110.0025, 105.0025, 100.0025, 95.0025, 90.0025, 85.0025, 80.0025, 75.0025, 70.0025, 65.0025, 60.0025, 55.0025, 50.0025, 45.0025, 40.0025, 35.0025, 30.002499999999998, 25.002499999999998, 20.002499999999998, 15.002499999999998, 10.002499999999998, 5.002499999999998, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 0.0024999999999977263, 5.002499999999998, 10.002499999999998, 15.002499999999998, 20.002499999999998, 25.002499999999998, 30.002499999999998, 35.0025, 40.0025, 45.0025, 50.0025, 55.0025, 60.0025, 65.0025, 70.0025, 75.0025, 80.0025, 85.0025, 90.0025, 95.0025, 100.0025, 105.0025, 110.0025, 115.0025, 120.0025, 125.0025, 130.0025, 135.0025, 140.0025, 145.0025, 150.0025, 155.0025, 160.0025, 165.0025, 170.0025, 175.0025, 180.0025, 185.0025, 190.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025, 195.0025]
    
}
