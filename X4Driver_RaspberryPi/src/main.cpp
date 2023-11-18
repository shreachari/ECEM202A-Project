#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <stdio.h>
#include <string.h>
#include <csignal>

#include <wiringPi.h>
#include "taskRadar.h"

#define DEBUG

using namespace std;

zmq::context_t context(1);
zmq::socket_t socket(context, ZMQ_PUB);

void signalHandler(int signal){
    
    if (signal == SIGINT){
        
        printf("Closing the sockets!\n""""""\n\n");
        socket.close();
        context.close();
        
    }
     
}

int main(int argc, char *argv[])
{
    std::signal(SIGINT, signalHandler);
    
    printf("raspbian_x4driver start to work!\n""""""\n\n");

    std::thread taskRadarThread(taskRadar, std::ref(socket));
    taskRadarThread.join();

    socket.close();
    context.close();
    printf("raspbian_x4driver done.\n");
    return 0;
}
