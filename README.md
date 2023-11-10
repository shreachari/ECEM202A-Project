# Breathing Coach


##Overview

This project aims to create a Breathing Coach app which guides a user through a breathing exercise and provides the user's breathing pattern and feedback in real time. 

To gather breathing data, we use a UWB sensor, which is attached to a Raspberry Pi, and located at a distance from the user. This data is then sent to an iOS app using the ZeroMQ Message Queue. We then perform data processing and data analysis to extract meaningful breathing signals and display the waveforms to the screen during the guided meditation. Our goal is to deliver real time feedback to the user during the guided meditation as well.

[Project Website](docs/index.md)


##Description

BreathingCoach folder has code for the swift iOS mobile app the user will use. UWHear_breath folder has the matlab code used to analyze and visualize information collected from sensor and Raspberry Pi. X4Driver_RaspberryPi folder has the code that will run on Raspberry Pi to collect data from sensor and transmit to mobile device. x4_frame_time.xlsx is an interactive spreadsheet for adjusting parameters related to the Raspberry Pi retrieving information from the sensor. 


##Setup Details

Place the sensor at a short distance aligned to your chest. Run the app in BreathingCoach folder.


