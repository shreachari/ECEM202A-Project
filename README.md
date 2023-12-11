# Breathing Coach


## Overview

This project aims to create a Breathing Coach app which guides a user through a breathing exercise and provides the user's breathing pattern and feedback in real time. 

To gather breathing data, we use a UWB sensor, which is attached to a Raspberry Pi, and located at a distance from the user. This data is then sent to an iOS app using the ZeroMQ Message Queue. We then perform data processing and data analysis to extract meaningful breathing signals and display the waveforms to the screen during the guided meditation. Our goal is to deliver real time feedback to the user during the guided meditation as well.

[Project Website](docs/index.md)


## Description

BreathingCoach folder has code for the swift iOS mobile app the user will use. UWHear_breath folder has the matlab code used to analyze and visualize information collected from sensor and Raspberry Pi. X4Driver_RaspberryPi folder has the code that will run on Raspberry Pi to collect data from sensor and transmit to mobile device. x4_frame_time.xlsx is an interactive spreadsheet for adjusting parameters related to the Raspberry Pi retrieving information from the sensor. 


## Setup Details

1. The current proof of concept setup requires both Raspberry Pi and your mac to be connected to NESL_150 WiFi.
2. Run the program Runme in the Raspberry Pi machine.
3. Place the sensor connected to Raspberry Pi at a short distance aligned to your chest.  
4. Make sure Xcode is installed on your mac. Run the app in BreathingCoach folder using below steps.
5. cd BreathingCoach
6. open BreathingCoach.xcworkspace (This should open the app in Xcode)
7. Product -> Desttination -> Destination architectures -> Show Rosetta Destinations
8. In the scheme at the top select iPhone 15 Pro (Rosetta)
9. Product -> Build
10. If there is trouble with any of above steps, consider updating macOS and Xcode version.
11. Press play button in top left to start running simulator/app.



