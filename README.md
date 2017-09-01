# REMON iOS SDK
# About
### RemoteMonster iOS SDK(Remonios)를 위한 API Reference Guide
- Remonios는 WebRTC기반의 API 플랫폼인 RemoteMonster를 iOS에서 사용할 수 있는 네이티브 기반의 SDK입니다.
- 최신 버전의 WebRTC 엔진을 사용하여 네이티브로 앱을 구현할 수 있으므로 NW.js나 여타 WebView를 사용해서 WebRTC를 구현하는 것보다 훨씬 자유도가 높고 성능이 좋습니다.
- 현재 Swift기반의 개발방식을 주로 지원하고 있으며 요청하실 경우 objC를 위한 헤더파일도 드리겠습니다.
- bitcode를 지원하여 좀 더 쉽고 가벼운 개발이 가능합니다.
- Remon 클래스와 RemonDelegate, 그리고 RemonConfig 세가지 클래스만 사용법을 알고 있으면 어렵지 않게 영상통신 앱을 개발할 수 있습니다.
- - - -
# 1. Install
## manual
[iOS SDK Getting Started · RemoteMonster Documents](https://docs.remotemonster.com/ko/GettingStartedIosSDK.html)

## cocoapods
SDK 설치를 원하는 프로젝트의 Podfile에  `pod 'Remon-iOS-SDK', '~> 0.1`을
추가 하거나
```
target 'MyApp' do
  pod 'Remon-iOS-SDK', '~> 0.1'
end
```
을 추가 합니다.
그리고 터미널에서 *pod install* 를 실행 합니다.
만약  *pod install* 이 동작하지 않는 다면 *pod update*를 실행 합니다.
- - - -
# 2. Interface
## Remon
RemoteMonster API를 사용하기 위한 가장 기본이 되는 클래스. Remon클래스를 통해 서버와 연결하고 명령을 보내고 종료한다. 서버로부터 메시지를 받는 것은 주로 RemonDelegate를 통해 처리한다.

#### init(delegate: config:)
- param
	- delegate:<RemonDelegate>
	RemonDelegate 구현 객체

	- config:RemonConfig
	RemonConfig 객체 (RemonConfig 참조)
	
#### connectChannel(chId:)
채널에 접속 혹은 생성을 시도 한다.
- param
	- chld:String
	접속 혹은 생성 하려는 Channel ID 값.
	Channel ID가 존재 하는 경우 해당 채널로 접속을 시도 하고, 
	Channel ID가 존재 하지 않을 경우 새로운 채널을 생성 한다.

#### getRemonState()
현재 연결 상태를 나타내는 RemonState값을 얻어 온다. (RemonState 참조)
- return -> RemonState

#### pauseRemoteAudio(pause:)
원격 대상의 음성을 소거 한다.
- param
	- pause:Bool
	음소거 여부를 나타내는 Boolean 값.

#### pauseLocalVideo(pause:)
자신(로컬)의 음성을 소거 한다.
- param
	- pause
	음소거 여부를 나타내는 Boolean 값.

#### switchCamera()
전면/후면 카메라를 전환 한다.

#### search(query:)
주어진 이름으로 채널 이름을 검색한다. 부분 검색이 가능하다.
- param
	- query:String
	검색 하려는 Channel ID

#### sendMessage(message:)
채널이 연결된 상태에서 상대편에게 메시지를 전달한다.
- param
	- message:String

#### startVideoCapturer(previewView:)
RemonConfig에 설정된 영상 정보를 바탕으로 영상 캡쳐를 시작 한다.
- param
	- previewView:RTCCameraPreviewView
	영상 캡쳐을 위한 WebRTC의 RTCCameraPreviewView 객체

#### close()
연결을 종료하고 모든 Remon과 관련된 자원을 해제한다.


## RemonConfig
Remon을 실행하기 전에 여러가지 통신/방송 상태를 미리 설정할 필요가 있음. 필수적으로 key와 serviceId가 있으며 그 외에도 음성만 사용하고자 할 경우 videoCall = false로 해야하며 비디오 코덱등도 수정이 가능하다.

### init()
RemonConfig 객체를 생성 한다. 기본 생성자.

#### iceServers:Array

#### key:String
RemoteMonster서버로부터 발급받은 인증 키

#### serviceId:String
RemoteMonster API를 사용하기 위해 필요한 서비스 id. Remotemonster 홈페이지에서 요청하여 받는다.

#### token:String
Remon객체를 생성하면 서버와 인증 후 받게 되는 일회성 용도의 token.

#### videoCall:Bool
음성만 사용할 경우 false, 영상도 사용할 경우 true

#### videoCodec:String
송출할 비디오의 영상 코덱. 기본은 H264이며 VP9, VP8등을 사용할 수 있다.

#### videoWidth:Int
송출할 비디오의 가로길이. 기본값은 640

#### videoHeight:Int
송출할 비디오의 세로길이. 기본값은 480

#### videoFps:Int
송출할 비디오의 frames per second. 기본값은 30

#### useFrontCamara:Bool
전면 카메라 사용 여부

#### remoteAudioMuted:Bool (draft)
원격 대상의 음성 소거 여부를 나타내는 Boolean 값.

#### localAudioMuted:Bool (draft)
자신(로컬)의 음성 소거 여부를 나타내는 Boolean 값.

#### remoteVideoSessionClosed:Bool (draft)
원격 대상의 영상 세션 상태를 나타내는 Boolean 값.

#### localVideoSessionClosed:Bool(draft)
자신(로컬)의 영상 세션 상태를 나타내는 Boolean 값.


## RemonError
Remon 에러 코드
#### enum RemonError:Error
case InvalidParameterError(String)
case UnsupportedPlatformError(String)
case InitFailedError(String)
case WebSocketError(String)
case ConnectChannelFailed(String)
case BusyChannelError(String)
case UserMediaDeviceError(String)
case IceFailed(String)
case Unknown(String)


## RemonState
#### enum RemonState:Int
case INIT *객체를 생성하여 서버와 웹소켓으로 연결되는 과정의 상태를 의미*
case WAIT *채널을 생성하고 상대의 연결을 기다리고 있을 때의 상태*
case CONNECT *상대편 채널에 접속중일 때의 상태*
case COMPLETE *상호간에 연결이 완료되었을 때의 상태*
case FAIL *통신 연결을 수행하다가 오류가 발생하였을 때의 상태*
case EXIT *통신 연결 후 빠져나갔을 때의 상태*
case CLOSE 


## RemonDelegate
Remon 작업 위임자. 
Remon의 상태변화, 에러발생 등의 이벤트가 발생 하였을 때
서비스 개발자에게 추가 처리를 위임 하기 위한 프로토콜

#### onStateChange(state:RemonState)
채널의 RemonState 상태가 변경되었을 때 발생
- param
	- state
	Remon의 현재 상태를 나타내는 상태 값(RemonState 참조)

#### didCreateLocalCapturer(localVideoCapturer:)
로컬의 영상 캡쳐 생성 후 호출.
이후 Remon의 startVideoCapturer 메소드를 이용 하여 영상 캡쳐가 가능 하다.
- param
	- localVideoCapturer:RTCCameraVideoCapturer
	영상 캡쳐 처리를 위한 WebRTC의 RTCCameraVideoCapturer 객체
	
#### didStartLocalCapturer(localVideoCapturer:)
Remon의 startVideoCapturer(preview:) 메소드가 호출 된 후 전달 받은 
preview에서 영상 캡쳐가 시작 된 후 호출
- param
	- localVideoCapturer:RTCCameraVideoCapturer
	영상 캡쳐 처리를 위한 WebRTC의 RTCCameraVideoCapturer 객체

#### didReceiveLocalVideoTrack(localVideoTrack:)
로컬의 음성,영상 자원을 받았을 때 호출됨
- param
	- localVideoTrack:RTCVideoTrack
	WebRTC의 RTCVideoTrack 객체

#### didReceiveRemoteVideoTrack(remoteVideoTrack:)
원격의 음성/영상 자원을 받았을 때 호출됨
- param
	- remoteVideoTrack:RTCVideoTrack
	WebRTC의 RTCVideoTrack 객체

#### onError(error:)
에러가 발생할 때 호출됨
- param
	- error:RemonError
	RemonError 참조
	
#### onMessage(message:)
채널이 연결된 상태에서 상대방에게서 메시지를 받았을 경우 호출
- param
	- message:String
	전달 받은 메세지 문자열	

#### onSearch(result:)
상대편의 연결이 종료 되었을 경우 발생
- param
	- result:Array
	검색 결과 리스트
	
#### func onDisconnectChannel()
채널과 나와의 연결이 완전히 종료 되었을 경우 발생함.

#### func onClose()
채널이 닫혔을 때 호출
- - - -
## 3. Sequence
작성 중

## 4. Example
작성 중