# Project Proposal

## 1. Motivation & Objective

We are building an iOS app that guides a user through a breathing exercise and provides real time feedback regarding the user's breathing pattern. We use a UWB radar to collect breathing data without physically touching the user.

## 2. State of the Art & Its Limitations

Breathing can be measured today using several approaches that all feature sensors that are physically attached to a user's body. One such approach is band that attaches around a users' chest and measures the vibrations in and around the chest. Another approach, [RESPA](https://www.zansors.com/respa), features a small clip on device that connects to an iOS or Android app to provide breathing data. This wearable sensor provides real time haptic feedback as well.

The limitations of these approaches are the reliance on wearable devices that can constrict the user's motion or be uncomfortable to wear.

## 3. Novelty & Rationale

Our approach uses an UWB sensor to measure breathing rate without physically touching the user. This allows users to breathe and meditate naturally without interference and distraction. Combining this benefit with real time feedback will allow users' phones to become virtual breathing coaches. 

We believe in this project as our team has experience coding mobile apps and is passionate about working on projects that provide health benefits. Additionally, this UWB sensor has been provided by Ziqi Wang.

## 4. Potential Impact

In the short term, this project will prove that it is possible to measure breathing and heart rate using a UWB sensor and provide real time feedback. After thorough development and experimentation, our app will allow mediation and yoga coaching to become more accessible as users will only need a sensor and phone to receive real time breathing feedback.

## 5. Challenges

One challenge is the networking between the sensor (raspberry pi) and iOS app. There are several possible methods of networking: Bluetooth, Web Sockets, Message Queues. It will be important to pick the optimal networking framework to assure data is sent continuously with little to no packet loss. Additionally, this data needs to be sent with minimal latency in order for the user to receive real time feedback. This will be challenging as well.

Another challenge will be to collect the optimal signal and perform the appropriate signal processing. This requires real time data analysis, which again is a challenging task given our strict latency constraints. Given our team has a computer science background, we will also need to gain an understanding of signal processing.

## 6. Requirements for Success

To perform the project, the following skills and resources are necessary:

### Skills
* C/C++ coding skills for the Raspberry Pi
* Networking frameworks (Web Socket or Message Queue Programming)
* iOS development in Swift
* Matlab or a comparable language for data analysis
* Signal Processing fundamentals
* UI/UX design for the app

### Resources
* UWB sensor from NESL lab
* Assistance from Ziqi Wang as needed

## 7. Metrics of Success

Our metrics of success are as follows:
1. UWB sensor data is sent from the raspberry pi to iOS app and can be displayed on the app as a waveform
2. The iOS app can take the user through a breathing exercise.
3. We can display the expected and actual breathing rate on the UI during the breathing exercise.

Some stretch goals are:
1. Provide feedback to the user in real time.
2. Provide support for multiple breathing patterns.
3. We can display the user's heart rate on the UI during the breathing exercise.

## 8. Execution Plan

We have broken our project up into sub tasks by week. Each week, we meet to divide tasks based on our experience, interests and availability. We meet in the NESL lab every Tuesday and Thursday and schedule additional lab sessions as needed.

**Week 3:** 
* Meet with Professor to get details on project
* Set up initial communication with NESL lab

**Week 4:** 
* Replicate the lab setup
    * Measure and Analyze sensor data- not in real time 
* Set up github repository
* Determine coding practices
* Second meeting with professor to share progress and get feedback.
* Determine whether to develop iOS or Android app

**Week 5:** 
* Create a basic app structure/code
* Work on networking between the raspberry pi and iOS app
    * Try using Web Socket
    * Set up ssh on the raspberry pi for smoother development

**Week 6:** 
* Debug Networking issues
    * Pivot to ZeroMQ (more lightweight)
* Set up ZeroMQ on raspberry pi
* Set up ZeroMQ on iOS app

**Week 7:**
* Get simple ZeroMQ communication working on personal laptops and replicate on raspberry pi
* Measure expected breathing pattern
    * Data Processing: take multiple samples, plot all together, take best fit graph as expected value
* Create a basic breathing exercise
* Work on midterm presentation

**Week 8:** 
* Midterm presentation in class
* App dev: Real time data display
    * Display both user’s and expected waveform on the screen
    * Compute delay
* Data Processing: Signal Processing
    * Determine which bin/waveform to use
        * Develop some algorithm/comparison mechanism
    * Determine what filters to use

**Week 9:** 
* Continue working on real time data display
* Implement feedback to user

**Week 10:** 
* Clean up code and beautify UI
* Work on stretch goals
* Work on final presentation

## 9. Related Work

### 9.a. Papers

### MindfulWatch: A Smartwatch-Based System For Real-Time Respiration Monitoring During Meditation
* The research paper introduces MindfulWatch, a smartwatch-based sensing system designed for real-time monitoring of respiration during meditation. MindfulWatch utilizes motion sensors to detect subtle wrist rotations induced by respiration, enabling accurate measurement of breathing patterns without the need for training. The system offers essential biosignals, including the duration of inhalation and exhalation, which can be used as objective measures of meditation efficacy. It aims to provide real-time feedback to meditators, potentially enhancing the effectiveness of meditation practice.
*  The research's emphasis on providing guidance without interrupting the meditative state aligns with the app's goal of offering unobtrusive and effective breathing feedback. Additionally, the app could explore incorporating visual or acoustic cues, as well as haptic feedback through vibration, to guide users in making their own adjustments for a more effective meditation experience. This integration of UWB radar sensing and user-friendly feedback mechanisms can significantly contribute to improving users' meditation practice and overall well-being.
### BreathCoach: A Smart In-home Breathing Training System with Bio-Feedback via VR Game
* The research introduces BreathCoach, a smart and unobtrusive system designed to enable in-home Respiratory Sinus Arrhythmia biofeedback-based Breathing Training (RSA-BT) using sensors on a smartwatch and smartphone-based virtual reality (VR). Traditional RSA-BT, which is beneficial for respiratory diseases, stress management, and anxiety, often requires in-person sessions and cumbersome devices, limiting accessibility. BreathCoach continuously measures key biosignals, such as breathing pattern, inter-beat interval, and amplitude of RSA, using sensors on a smartwatch. It intelligently calculates the optimal breathing pattern based on real-time and historical measurements and conveys this information to users through VR games, providing intuitive guidance.
* In the context of developing an app providing breathing feedback using a UWB radar sensor, BreathCoach's approach highlights the potential of integrating UWB radar sensors into wearable devices for accurate and unobtrusive physiological measurements. UWB radar sensors could enhance the system's ability to capture subtle movements related to breathing patterns, allowing for precise and real-time feedback.
### Attention Regulation Framework: Designing Self-Regulated Mindfulness Technologies
* The research proposes a novel framework called Attention Regulation Framework (ARF) for self-regulated mindfulness applications, aiming to enhance human well-being. Unlike existing mindfulness apps that rely on guided meditation, ARF focuses on self-regulated meditation by encouraging users to bring their attention back to the present moment through subtle movements. The framework includes mindfulness interaction design guidelines and interfaces supported by non-intrusive detection-feedback mechanisms.
* The research demonstrates the effectiveness of ARF in static and kinetic meditation conditions through user evaluation studies. Compared to guided meditation apps, the ARF-based design cases improve attention, mindfulness, mood, well-being, and physical balance. The framework allows users to self-regulate their attention and practice mindfulness in various postures, catering to individual preferences.
* In the context of developing an app providing breathing feedback using a UWB radar sensor, the ARF framework emphasizes the importance of adaptability and user-centric design. By incorporating UWB radar sensors, the app could detect subtle movements related to breathing patterns, enabling users to regulate their attention and achieve mindfulness. The non-intrusive nature of UWB radar sensors aligns with ARF's focus on subtle and natural interactions, enhancing the user experience. Additionally, the app's ability to adapt to different environments and user preferences can lead to greater acceptance and usability, promoting overall well-being in society.
### BreathIE: Estimating Breathing Inhale Exhale Ratio Using Motion Sensor Data from Consumer Earbuds
* The research paper introduces a novel algorithm called BreathIE, which utilizes a low-power motion sensor embedded in consumer-grade earbuds to estimate breathing rate and Inhale/Exhale (IE) ratio. The IE ratio is a critical biomarker for pulmonary and psychological health, indicating lung obstruction for chronic lung patients and detecting psycho-social stress in healthy individuals. The algorithm is adaptive, dynamically adjusting to the user's varying breathing durations in real time. In a study involving 30 participants, BreathIE demonstrated accurate estimation of breathing rate (mean absolute error of 2.37 breaths per minute) and IE ratio (mean absolute error of 0.27), outperforming existing algorithms and validating its effectiveness.
* In the context of developing an app that provides breathing feedback using an Ultra-Wideband (UWB) radar sensor, the BreathIE algorithm showcases the potential for integrating similar adaptive algorithms into wearable devices.
### RunBuddy: A Smartphone System for Running Rhythm Monitoring
* The research paper introduces RunBuddy, a smartphone-based system for continuous running rhythm monitoring. The system aims to improve exercise efficiency and delay fatigue by ensuring proper coordination between breathing and strides during running. RunBuddy utilizes a combination of ambient sensing using accelerometer and microphone, along with a physiological model called Locomotor Respiratory Coupling (LRC), which indicates possible ratios between stride and breathing frequencies. The system overcomes challenges related to low-intensity breathing sounds and interference, achieving a 92.7% accuracy rate in measuring running rhythm. RunBuddy provides users with detailed physiological profiles of their running process, enhancing their understanding of their performance and potentially improving exercise self-efficacy.
* In the context of our app, the research findings highlight the significance of proper coordination between breathing and strides in running. The app could utilize similar techniques, integrating UWB sensor data with ambient sensing and physiological models like LRC to provide real-time feedback to runners. By helping users optimize their breathing patterns in relation to their strides, the app could enhance their overall running experience, potentially leading to improved performance and reduced fatigue.

### 9.b. Datasets

Our project will feature real time data collected from the NESL lab's UWB sensor. We will construct datasets as needed from this data.

### 9.c. Software

* C/C++/Linux for Raspberry Pi
* ZeroMQ for networking between Raspberry Pi and mobile device
* Swift/Xcode for iOS development
* Matlab if needed for data processing

## 10. References

### Papers
* [MindfulWatch](https://dl.acm.org/doi/10.1145/3130922#:~:text=Operating%20solely%20on%20a%20smartwatch,%2Fs%20induced%20by%20respiration.)
    * T. Hao, C. Bi, G. Xing, R. Chan and L. Tu, "MindfulWatch: A smartwatch-based system for real-time respiration monitoring during meditation", Proc. ACM Interact. Mobile Wearable Ubiquitous Technol., vol. 1, no. 3, pp. 1-19, 2017.
* [BreathCoach](https://dl.acm.org/doi/10.1145/3267305.3267582)
    * L. Tu, C. Bi, T. Hao and G. Xing, "BreathCoach: A smart in-home breathing training system with bio-feedback via VR game", Proc. ACM Int. Joint Conf. Int. Symp. Pervasive Ubiquitous Comput. Wearable Comput., 2018.
* [Attention Regulation Framework](https://psycnet.apa.org/record/2020-09848-004)
    * Niksirat, K. S., Silpasuwanchai, C., Cheng, P., & Ren, X. (2019). Attention regulation framework: Designing self-regulated mindfulness technologies. ACM Transactions on Computer-Human Interaction, 26(6), 1–44. https://doi.org/10.1145/3359593
* [BreathIE](https://ieeexplore.ieee.org/document/10096084)
    * N. Rashid, M. Rahman, T. Ahmed, J. Kuang and A. Gao, "Breathie: Estimating breathing inhale exhale ratio using motion sensor data from consumer earbuds", IEEE International Conference on Acoustics Speech and Signal Processing (ICASSP), pp. 1-5, 2023.
* [RunBuddy](https://dl.acm.org/doi/10.1145/2750858.2804293)
    * Tian Hao, Guoliang Xing, and Gang Zhou. 2015. RunBuddy: a smartphone system for running rhythm monitoring. In Proceedings of the 2015 ACM International Joint Conference on Pervasive and Ubiquitous Computing. 133–144.

### Software
* [C++](https://cplusplus.com/)
* [ZeroMq](https://zeromq.org/)
* [Swift](https://developer.apple.com/swift/)
* [Matlab](https://www.mathworks.com/academia/tah-portal/ucla-31454052.html)
