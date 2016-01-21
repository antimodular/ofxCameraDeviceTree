#pragma once

#include "ofMain.h"

#include "ofxCameraDeviceTree.h"

class ofApp : public ofBaseApp{
	public:
		void setup();
        void exit();
		void update();
		void draw();
		
		void keyReleased(int key);

    
    ofxCameraDeviceTree manager;
    vector<string> allDevices;
    vector<unsigned int> allLocationsIDs;
};
