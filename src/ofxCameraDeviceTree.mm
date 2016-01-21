#include "ofxCameraDeviceTree.h"
#include "ofLog.h"
//#include "ofAppRunner.h"
//#include "ofGraphics.h"
#include "ofSystemUtils.h"

//#import <Foundation/Foundation.h>

#include <QTKit/QTKit.h>
//#import <QuickTime/QuickTime.h>
//#import <Accelerate/Accelerate.h>

//#include <IOKit/IOKitLib.h>
//#include <IOKit/IOMessage.h>
//#include <IOKit/IOCFPlugIn.h>
//#include <IOKit/usb/IOUSBLib.h>

#pragma mark -
#pragma mark public


#if defined(MAC_OS_X_VERSION_10_9)
#warning Using QTKit, which is deprecated in OSX 10.9
#endif
/*
@interface QTKitVideoGrabber : QTCaptureVideoPreviewOutput
{
    QTCaptureSession *session;
    QTCaptureDeviceInput *videoDeviceInput;
    QTCaptureDeviceInput *audioDeviceInput;
    QTCaptureDevice* selectedVideoDevice;
    QTCaptureDevice* selectedAudioDevice;
    QTCaptureMovieFileOutput *captureMovieFileOutput;
    NSInteger width, height;
    NSInteger videoDeviceID, audioDeviceID;
    
    CVImageBufferRef cvFrame;
    ofPixels* pixels;
   // ofQTKitGrabber* grabber;
    
    BOOL hasNewFrame;
    BOOL isFrameNew;
    BOOL isRecording;
    BOOL isRecordReady;
    BOOL useAudio;
}

@end
*/
ofxCameraDeviceTree::ofxCameraDeviceTree() {
#ifndef TARGET_OSX
    ofSystemAlertDialog("Sorry! ofxCameraDeviceTree supports only MacOS.");
#endif
}

const vector<string>& ofxCameraDeviceTree::listVideoDevicesByName() const{
    @autoreleasepool {
//        NSArray* videoDevices = [QTKitVideoGrabber listVideoDevices];
//        videoDeviceVec.clear();
//        for (id object in videoDevices){
//            string str = [[object description] UTF8String];
//            videoDeviceVec.push_back(str);
//        }

        NSArray * _captureDevices = [[QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeVideo]
                                     arrayByAddingObjectsFromArray:[QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeMuxed]];
      //  NSLog(@" _captureDeviceCount count is %li" , (unsigned long)_captureDevices.count);
        
        videoDeviceVec.clear();
        for (int i = 0; i < _captureDevices.count; i++)
        {
            QTCaptureDevice *capDevice = [_captureDevices objectAtIndex:i];
            // NSLog(@"capDevice is: %@" , capDevice);
            // NSLog(@"capDevice uniqueID is: %@" , capDevice.uniqueID);
            
            string str =  [capDevice.localizedDisplayName UTF8String];
            videoDeviceVec.push_back(str);
            
        }

    }
    return videoDeviceVec;
}

const vector<string>& ofxCameraDeviceTree::listVideoDevicesByUniqueID() const{
    @autoreleasepool {
        
        NSArray * _captureDevices = [[QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeVideo]
                                     arrayByAddingObjectsFromArray:[QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeMuxed]];
       // NSLog(@" _captureDeviceCount count is %li" , (unsigned long)_captureDevices.count);
        
        videoDeviceVec.clear();
        for (int i = 0; i < _captureDevices.count; i++)
        {
            QTCaptureDevice *capDevice = [_captureDevices objectAtIndex:i];
           // NSLog(@"capDevice is: %@" , capDevice);
           // NSLog(@"capDevice uniqueID is: %@" , capDevice.uniqueID);
            string str =  [capDevice.uniqueID UTF8String];

            videoDeviceVec.push_back(str);
            
        }
        
        
    }
    return videoDeviceVec;
}

const vector<string>& ofxCameraDeviceTree::listVideoDevicesByModelID() const{
    @autoreleasepool {
        
        NSArray * _captureDevices = [[QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeVideo]
                                     arrayByAddingObjectsFromArray:[QTCaptureDevice inputDevicesWithMediaType:QTMediaTypeMuxed]];
       // NSLog(@" _captureDeviceCount count is %li" , (unsigned long)_captureDevices.count);
        
        videoDeviceVec.clear();
        for (int i = 0; i < _captureDevices.count; i++)
        {
            QTCaptureDevice *capDevice = [_captureDevices objectAtIndex:i];
            // NSLog(@"capDevice is: %@" , capDevice);
            // NSLog(@"capDevice uniqueID is: %@" , capDevice.uniqueID);
           
            //string str =  [capDevice.uniqueID UTF8String];
            string str =  [capDevice.modelUniqueID UTF8String];
            
            videoDeviceVec.push_back(str);
            
        }
        
        
    }
    return videoDeviceVec;
}