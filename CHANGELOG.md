## 2.6.10
- supported xcode11 and swift5.1
- added static funtion for setting default AVAudioSession.Category
- refactored codes
- fixed minor bugs

## 2.6.9
- integrated codes for calling callback on ui thread
- fixed wrong command message

## 2.6.8
- fixed SDP customized setting for bandwidth

## 2.6.7
- fixed the url of fetchChannel function
- fixed sending statistics for connection status 

## 2.6.6
- added some configuration for host urls

## 2.6.5
- fixed a issue for multiple peer connection

## 2.6.4
- possible to select supported video codec(H264,VP8) when RemonCast is starting to broadcast

## 2.6.3
- added sendMessage( message:String ) to RemonCall, RemonCast

## 2.6.2
- changed switchCamera function. switchCamera( isMirror:Bool, isToggle:Bool )
- added RemonSampleCapturer and example project for using it 
- fixed minor bugs

## 2.6.1
- Added capture functionality for fixed camera rotation
- Added camera mirror mode
- Added a sample project : 'examples/BaseExamples/'
- fixed front camera mirror mode
- fixed local view rotation direction is based on UI orientation
- modified strong circular references
- fixed minor bugs

## 2.6.0
- support latest webrtc library

## 2.5.0
- support swift 5
- removed AVAudioSession controll code

## 2.4.50
- support swift 5

## 2.4.499
- merged features with 2.6.2 for swift4.2
- XCode 10.1

## 2.4.498
- fixed front camera mirror mode
- fixed local view rotation direction is based on UI orientation

## 2.4.497
- Added capture functionality for fixed camera rotation
- Added camera mirror mode
- bug fix 
- modified strong circular references
- fixed minor bugs

## 2.4.491
- bug fix 
- unpackAecDump(resultFileName: "record.mp4", avPreset: .MP4MEDIUM, progress: (error, state) -> Void)
- Change REMON_AECUNPACK_STATE

## 2.4.49
- Change time to add videoRender at videoTrack
- Change call interval of onRemonStatReport()

## 2.4.48
- modify debug log for issue tracking
- bug fix
- sockect reconnect error


## 2.4.44
- add getCurrentStateString()
- bug fix
- support switchCameta for objc


## 2.4.43
- add property useExternalCapturer at RemonController And RemonConfig
- add Class RemonSampleCapturer
- Used through localExternalCaptureDelegator at RemonController

## 2.4.38
- add property volumeRatio at RemonController
- add property userMete at RemonConfig
- add callback func onRetry at RemonController

## 2.4.20
- change default audio session category
- change health log cycle
- change health log rule

## 2.4.13
- bug fix
- No crash without a channel id

## 2.4.0.1
- add observer method
- onRemoteVideoSizeChanged
- onLocalVideoSizeChanged

## 2.3.9
- change videoView access controll

## 2.3.8
- support mute at objc

## 2.3.7
- hotfix unpackAecDump()

## 2.3.6
- add unpackAecDump 
```
RemonCall.unpackAecDump(dumpName: "audio.aecdump", resultFileName: "unpack.m4a", avPreset:.MP4MEDIUM, progress:{(_, _) in }
```
## 2.3.4
- getHealthRating 호출시 비정상 종료 되는 문제 수정
- getHealthRating가 objc 환경에서 동작 하도록 수정

## 2.3.0
- objc 에서 녹음 기능 지원

## 2.2.9
- bug fix
- do not called 'onClose()'

## 2.2.8
- bug fix

## 2.2.7
- swift 4.2 supported

## 2.2.5
- sorry .. my mistake

## 2.2.4
- bug fix

## 2.2.3
- add objc error callback
```
[self.remonCast onObjcErrorWithBlock:^(NSError * _Nonnull error) {
// Do something
}];
```

## 2.2.2
- objc supported (RemonStatReport)

## 2.2.1
- objc supported

## 2.2.0
- bugfix objc에서 2.0를 사용이 안되는 문제 수정.

## 2.1.9
- change access control of RemonStatReport

## 2.1.8
- support VP8 and simulcast
- stat log

## 2.1.6
- fix! onComplete() Duplicate invocation 

## 2.1.3
- add builtInReceiverOverideToSpeaker IBInspectable property
- default is true
- If you want to change the output device
```
// in runtime!!!
remonCall.builtInReceiverOverideToSpeaker = !remonCall.builtInReceiverOverideToSpeaker
```
