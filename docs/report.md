# Table of Contents
* Abstract
* [Introduction](#1-introduction)
* [Related Work](#2-related-work)
* [Technical Approach](#3-technical-approach)
* [Evaluation and Results](#4-evaluation-and-results)
* [Discussion and Conclusions](#5-discussion-and-conclusions)
* [References](#6-references)

# Abstract

This project aims to create a Breathing Coach app which guides a user through a breathing exercise and provides the user's breathing pattern and feedback in real time. 

To gather breathing data, we use a UWB sensor, which is attached to a Raspberry Pi, and located at a distance from the user. This data is then sent to an iOS app using the ZeroMQ Message Queue. We then perform data processing and data analysis to extract meaningful breathing signals and display the waveforms to the screen during the guided meditation. Our goal is to deliver real time feedback to the user during the guided meditation as well.

This project is in collaboration with the NESL Lab and Ph.D. Candidate Ziqi Wang.

# 1. Introduction

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

# 2. Related Work

# 3. Technical Approach

# 4. Evaluation and Results

# 5. Discussion and Conclusions

# 6. References