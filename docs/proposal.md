# Project Proposal

## 1. Motivation & Objective

We are building an iOS app that guides a user through a breathing exercise and provides real time feedback regarding the user's breathing pattern. We use an UWB radar to collect breathing data without physically touching the user.

## 2. State of the Art & Its Limitations

Breathing can be measured today using several approaches that all feature sensors that are physically attached to a user's body. One such approach is band that attaches around a users' chest and measures the vibrations in and around the chest. Another approach, [RESPA](https://www.zansors.com/respa), features a small clip on device that connects to an iOS or Android app to provide breathing data. This wearable sensor provides real time haptic feedback as well.

The limitations of these approaches are the reliance on wearable devices that can constrict the user's motion or be uncomfortable to wear.

## 3. Novelty & Rationale

What is new in your approach and why do you think it will be successful?

Our approach uses an UWB sensor to measure breathing rate without physically touching the user. This allows users to breathe and meditate naturally without interference and distraction. Combining this benefit with real time feedback will allow users' phones to become virtual breathing coaches. 

We believe in this project as our team has experience coding mobile apps and is passionate about working on projects that provide health benefits. Additionally, this UWB sensor has been provided by Ziqi Wang.

## 4. Potential Impact

In the short term, this project will prove that it is possible to measure breathing and heart rate using an UWB sensor and provide real time feedback. After thorough development and experimentation, our app will allow mediation and yoga coaching will become more accessible as users will only need a sensor and phone to receive real time breathing feedback.

## 5. Challenges

One challenge is the networking between the sensor (raspberry pi) and iOS app. There are several possible methods of networking: Bluetooth, Web Sockets, Message Queues. It will be important to pick the optimal networking framework to assure data is sent continuously with little to no packet loss. Additionally, this data needs to be sent with minimal latency in order for the user to receive real time feedback. This will be challenging as well.

Another challenge will be to collect the optimal signal and perform the appropriate signal processing. This requires real time data analysis, which again is a challenging task given our latency constraints. Given our team has a computer science background, we will also need to gain an understanding of signal processing.

## 6. Requirements for Success

To perform the project, the following skills and resources are necessary:

*Skills*
* C/C++ coding skills for the Raspberry Pi
* Networking frameworks (Web Socket or Message Queue Programming)
* iOS development in Swift
* Matlab or a comparable language for data analysis
* Signal Processing fundamentals
* UI/UX design for the app

*Resources*
* UWB sensor from NESL lab
* Assistance from Ziqi Wang as needed

## 7. Metrics of Success

Our metrics of success are as follows:
1. UWB sensor data is sent from the raspberry pi to iOS app and can be displayed on the app as a waveform
2. The iOS app can take the user through a breathing exercise.
3. We can display the expected and actual breathing rate on the UI during the breathing exercise.
4. We can display the user's heart rate on the UI during the breathing exercise.

Some stretch goals are:
1. Provide feedback to the user in real time.
2. Provide support for multiple breathing patterns.

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
* Work on midterm presentation

**Week 7:** 
* Midterm presentation in class
* Measure expected breathing pattern
    * Data Processing: take multiple samples, plot all together, take best fit graph as expected value
* Create a basic breathing exercise

**Week 8:** 
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

List the key papers that you have identified relating to your project idea, and describe how they related to your project. Provide references (with full citation in the References section below).
**COMPLETE**

* MindfulWatch: A Smartwatch-Based System For Real-Time Respiration Monitoring During Meditation
* BreathCoach: A Smart In-home Breathing Training System with Bio-Feedback via VR Game
* Attention Regulation Framework: Designing Self-Regulated Mindfulness Technologies
* BreathIE: Estimating Breathing Inhale Exhale Ratio Using Motion Sensor Data from Consumer Earbuds
* RunBuddy: A Smartphone System for Running Rhythm Monitoring


### 9.b. Datasets

Our project will feature real time data collected from the NESL lab's UWB sensor. We will construct datasets as needed from this data.

### 9.c. Software

* C/C++/Linux for Raspberry Pi
* ZeroMQ
* Swift/Xcode for iOS development
* Matlab if needed for data processing

## 10. References

List references correspondign to citations in your text above. For papers please include full citation and URL. For datasets and software include name and URL.
**NEED TO ADD CITATION**

Papers
* [MindfulWatch](https://dl.acm.org/doi/10.1145/3130922#:~:text=Operating%20solely%20on%20a%20smartwatch,%2Fs%20induced%20by%20respiration.)
* [BreathCoach](https://dl.acm.org/doi/10.1145/3267305.3267582)
* [Attention Regulation Framework](https://psycnet.apa.org/record/2020-09848-004)
* [BreathIE](https://ieeexplore.ieee.org/document/10096084)
* [RunBuddy](https://dl.acm.org/doi/10.1145/2750858.2804293)

Software
* [C++](https://cplusplus.com/)
* [ZeroMq](https://zeromq.org/)
* [Swift](https://developer.apple.com/swift/)
* [Matlab](https://www.mathworks.com/academia/tah-portal/ucla-31454052.html)
