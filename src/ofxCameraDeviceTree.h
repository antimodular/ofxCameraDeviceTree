#pragma once

#include <iostream>
#include <vector>
//#include "ofRectangle.h"

#include <CoreFoundation/CoreFoundation.h>

//#include <IOKit/IOKitLib.h>
//#include <IOKit/IOMessage.h>
//#include <IOKit/IOCFPlugIn.h>
//#include <IOKit/usb/IOUSBLib.h>



using namespace std;


class ofxCameraDeviceTree{
	
public:
	

    ofxCameraDeviceTree();
    const vector <string> & listVideoDevicesByName() const;
    const vector <string> & listVideoDevicesByUniqueID() const;
    const vector <string> & listVideoDevicesByModelID() const;
    
  //  vector<string> listDevices(string specificDevice = "");
  //   vector<unsigned int> getLocationIDs(string specificDevice = "");
    
protected:
	mutable vector <string>  videoDeviceVec;
};

