#include "ofApp.h"


void ofApp::setup() {
    ofSetLogLevel(OF_LOG_VERBOSE);
    
    allDevices = manager.listVideoDevicesByName();
    
    if(allDevices.size() > 0){
        for(int i=0; i<allDevices.size();i++){
            ofLog()<<" device "<<i<<" = "<<allDevices[i];
        }
    }else{
        ofLog()<<"no devices found";
    }
    
    allDevices.clear();
    allDevices = manager.listVideoDevicesByUniqueID();
    
    if(allDevices.size() > 0){
        for(int i=0; i<allDevices.size();i++){
            ofLog()<<" device "<<i<<" = "<<allDevices[i];
        }
    }else{
        ofLog()<<"no devices found";
    }
    
    
    allDevices.clear();
    allDevices = manager.listVideoDevicesByModelID();
    
    if(allDevices.size() > 0){
        for(int i=0; i<allDevices.size();i++){
            ofLog()<<" device "<<i<<" = "<<allDevices[i];
        }
    }else{
        ofLog()<<"no devices found";
    }
    
}

void ofApp::exit(){
    std::exit(1);
}

void ofApp::update() {
    
}

void ofApp::draw() {
    
}

void ofApp::keyReleased(int key) {
    
}




