# sleep_apnea
종합설계 프로젝트2 - IoT 생체신호 감지 모듈 개발

# SW Tool To Use
* 개발환경 : IOS
* 언어 : Swift
* 개발도구: Xcode
* 센서 모듈: 아두이노

# 추진배경
* IoT 생체신호 감지 응급상황 발생에서 위험상황의 유연한 대처 제품개발


# 1. 프로젝트 수행 배경
## 1.1 수면 무호흡증 감지 기술 개발의 필요성
![noname01](https://user-images.githubusercontent.com/51878026/183586000-7f30b833-fc0d-4b37-9cec-bbc2a78416cc.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname02](https://user-images.githubusercontent.com/51878026/183586958-cd9e2248-50e8-460a-9b7e-455bcd711ccc.png)  
```    
 [그림 1] 정상적인 호흡                 [그림 2] 수면 무호흡증  
```

* 수면 무호흡증이란 질병관리본부에 의해 정의된 바에 따르면 수면 중 최소 10초 이상 호흡이 멈추는 경우가 시간당 5회 이상 일어나면 수면 무호흡증이라고 정의한다.
* 수면 무호흡증은 폐쇄형, 중추형, 혼합형의 세 가지 형태로 구분된다. 이 중 폐쇄형이 가장 흔하고 중추형이 가장 드물다. 혼합형은 이 두 가지 형태의 증상이 같이 존재하는 것이다.
* 폐쇄의 원인은 수면 중 기도 주변의 근육이 너무 많이 이완되어 기도가 막히거나, 목 주변의 많은 지방으로 인해서, 그리고 염증이 생긴 편도선 또는 다른 일시적인 이유 등이 있다.
* 수면무호흡증의 가장 흔한 증상은 코골이다. 코골이 이외에도 수면 중 헐떡거리며 일어나거나 잠시 숨을 멈추는 증상을 보이기도 한다.
* [그림 1]의 경우는 정상적으로 수면중인 모습이고, [그림 2]의 경우는 수면 무호흡증인 상태이다.
* 수면 무호흡증은 다른 질병들의 원인이 되는 경우가 많다.
* 수면 중 무호흡이 일어나면, 스트레스 호르몬의 분비를 유도하거나, 심혈관계를 자극하여 고혈압, 심장질환, 뇌졸중, 부정맥과 같은 질병을 일으킬 수 있다는 것이 밝혀졌다.
* 이런 질병들이 발생할 수 있기 때문에 수면 무호흡증을 빨리 발견하고 치료하는 것이 중요하다.
* 우리는 IOS 생체신호 감지 개발을 통해 수면 무호흡증을 조기에 감지하여 사람들의 건강을 돕는 것이 최종 목표이다.

## 1.2 프로젝트 구성도
![K-018](https://user-images.githubusercontent.com/51878026/184543403-1a0195ce-ce92-451c-b07d-fc2afb4da265.png)
[그림 4] 프로젝트 구성도 

# 2. 프로젝트 목표  
## 2.1 SwiftUI 익히기  
![noname04](https://user-images.githubusercontent.com/51878026/183600277-81b34879-535d-4403-886f-7f3d8445d5fe.png)    
[그림 4] Swift 강의 영상    
* 개발 언어는 Swift이고, 우선 강의 사이트에서 Swift 언어를 학습한다.
* 학습한 뒤 호흡에 대한 데이터를 표현하고, 사용자나 보호자에 대한 정보를 나타내주는 유저 인터페이스를 구성하도록 한다. 

## 2.2 구매할 아두이노 부품 선정  
![noname05](https://user-images.githubusercontent.com/51878026/183600306-9b08f519-e537-4562-91dd-f4e54d1da89c.png)  
[그림 5] 바람센서  
* 본 프로젝트에서는 사람의 호흡을 감지할 아두이노의 센서가 필요했다. 대표적으로 사람의 호흡 소리를 감지하는 소리 센서와, 직접적인 호흡(바람)을 감지하는 바람 센서 이 2가지로 사람의 호흡을 감지할 수 있을 것이다. 우리는 바람 센서로 진행하는 것을 목표로 하였다.
* 이 외에도 브레드보드, 우노 호환보드, USB 케이블, 스마트폰과 통신할 블루투스 모듈, 점퍼케이블 등을 이용하여 호흡을 감지할 아두이노를 완성한다.  
## 2.3 아두이노로부터 받은 데이터 표현
* 조립한 아두이노로부터 호흡에 대한 정보를 받으면, 그것을 그래프, 텍스트(무호흡 발생 횟수, 평균 시간 등.)로 표현하도록 한다.

## 2.4 보호자 정보 저장 및 푸시 알림
* 사용자가 수면 무호흡증이 오랫동안 일어난다면, 보호자에게 알림이 가도록 한다.
* 이 과정에서는 파이어베이스 클라우드 시스템을 사용하여 보호자에게 푸시알림이 가도록 구현한다.
# 3. 프로젝트 수행 결과 
## 3.0 실행 결과  
![KakaoTalk_20210607_232448827](https://user-images.githubusercontent.com/51878026/184528932-9cf7f8a5-363a-47da-adab-e2a061366b54.gif)

## 3.1 User Interface
* 초기에 Swift를 배우면서 구현하였던 UI이다.
* (추후에 적용될 기능 구현 등에 따라서 조금씩 변경되었다.)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![noname06](https://user-images.githubusercontent.com/51878026/183600308-e6d812aa-2e47-4c76-b78a-52c105c0839f.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname07](https://user-images.githubusercontent.com/51878026/183600310-cd4c365e-1aeb-496f-a2f2-98c8668ded2f.png)  
```
[그림 6] 블루투스 스캔                         [그림 7] [그림 6]의 구현 코드  
```


* 첫 번째 화면으로 블루투스 스캔 화면이 나오도록 한다.
* 어플의 블루투스 스캔 기능으로 조립한 아두이노의 블루투스 4.0 BLE HM-10와 통신하게 된다.  
![noname08](https://user-images.githubusercontent.com/51878026/183600312-27d5d87c-ca48-4f9e-bbb6-e89f2177272e.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname09](https://user-images.githubusercontent.com/51878026/183600313-171674f7-3f61-496a-b7ea-3f461995bab7.png)  
```
  [그림 8] 보호자 정보 입력                      [그림 9] [그림 8]의 구현 코드             
```

![noname10](https://user-images.githubusercontent.com/51878026/183612843-94653c78-69b2-4c97-b8bb-aeca24d1f977.png)  
```
   [그림 10] [그림 8]의 구현 코드 
```
 
* 사용자의 이름, 보호자의 이름과 전화번호를 입력하는 화면이다.
* 이 정보를 통해 추후에 보호자들에게 알림이 가도록 한다.  
![noname11](https://user-images.githubusercontent.com/51878026/183612853-c298eea7-cb99-4fd9-883e-c2899e99cfa8.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 ![noname12](https://user-images.githubusercontent.com/51878026/183612857-be8ba929-b187-4590-814e-6bf660e8c7a7.png)    
 ```
  [그림 11] 호흡 데이터 시각화                       [그림 12] [그림 11]의 구현 코드 
 ```

 ![noname13](https://user-images.githubusercontent.com/51878026/183612861-7b5fb26a-c6f7-4d74-ae8c-85c3442ada2c.png)    
 [그림 13] [그림 11]의 구현 코드  
* 아두이노의 센서로부터 받은 호흡정보를 시각화하여 보여주는 화면이다.
* 정보 텍스트 위에는 나중에 그래프로 호흡 정보를 표현할 수 있다.  
&nbsp;&nbsp;&nbsp;![noname14](https://user-images.githubusercontent.com/51878026/183612864-0de6edfd-a6e0-454b-bd92-6115e7e7d8de.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname15](https://user-images.githubusercontent.com/51878026/183612869-6296743e-21c3-4710-ab04-a7ed99bd41eb.png)   
```
  [그림 14] 알림 기록, 보호자 정보                 [그림 15] [그림 14]의 구현 코드 일부
``` 

* 보호자의 정보와 사용자의 위험 알림 내역 등을 나타내주는 화면이다.  
## 3.2 아두이노  
![noname16](https://user-images.githubusercontent.com/51878026/183641392-06f7ac4c-4af2-4fb2-a135-6289af962daf.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname17](https://user-images.githubusercontent.com/51878026/183641397-1a96f184-6ad6-40a4-a8f4-cc73cfd89eef.png)  
```
       [그림 16] 아두이노 부품 구입 내역                               [그림 17] 바람센서 구매 내역    
```
    
* 아두이노를 조립하여 작동시키기 위해 필요한 필수적인 부품들인 [그림 16]의 부품들을 구매하였다.  
* 그리고 사람의 호흡을 감지할 바람 센서를 구매하였다  
![noname18](https://user-images.githubusercontent.com/51878026/183641403-d285e631-551e-4c2d-a765-ffdfc75e6018.png)    
[그림 18] 구매한 아두이노 부품 사진  
![noname19](https://user-images.githubusercontent.com/51878026/183641407-a0ee8f11-1737-445f-83d7-7f5c1f94c059.png)  
[그림 19] 조립된 아두이노  
* 조립한 아두이노의 모습이다.
* USB 케이블로 전원을 공급하고 있다.
* 블루투스 HM-10의 연결은 다음의 결선표대로 연결하였다.    
![K-005](https://user-images.githubusercontent.com/51878026/183641924-e6074274-f7d1-48eb-a866-71243645668c.png)   
* 바람센서의 연결은 다음의 결선표대로 연결하였다.   
![K-017](https://user-images.githubusercontent.com/51878026/183641927-35937af8-b491-4297-a145-595624a194e7.png)    
## 3.2-1) 블루투스 통신 결과    
![noname20](https://user-images.githubusercontent.com/51878026/183641412-a3cfb936-06a5-48aa-95ce-729f46845386.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname21](https://user-images.githubusercontent.com/51878026/183641416-6cc32f16-e3b7-4b9c-b77d-3d1d46a357fe.png)
```
    [그림 20] 아두이노 시리얼 모니터 화면                       [그림 21] Serial Bluetooth Terminal
```


![noname22](https://user-images.githubusercontent.com/51878026/183641417-31581c77-1582-4f12-a17f-1c4cfb95b2d6.png)  
[그림 22] 블루투스 통신 아두이노 코드  
* Serial Bluetooth Terminal 어플과 아두이노의 블루투스 HM-10 사이의 통신에 성공한 모습이다.
* 먼저 통신에 성공하면 Hello! 라는 텍스트가 나오고 시리얼 모니터에서 텍스트를 입력하면 휴대폰에 나오게 되고, 그 반대도 마찬가지이다.
* 아두이노 코드는 [그림 22]과 같다.  
## 3.2-2) 바람센서 작동 결과  

![noname23](https://user-images.githubusercontent.com/51878026/183650064-84da6d38-cb5a-4458-a535-444ac91feab4.png)  
[그림 23] 바람센서 작동 결과  
![noname24](https://user-images.githubusercontent.com/51878026/183650071-6e620220-10ad-4f4c-be1f-45f33f9aafc9.png)
![noname24_1](https://user-images.githubusercontent.com/51878026/183650074-ba73b041-6f47-4df7-a855-aeea5f68361a.png)
![noname24_2](https://user-images.githubusercontent.com/51878026/183650076-f56c04c2-81ad-4b0c-99a3-015a93be3404.png)
![noname24_3](https://user-images.githubusercontent.com/51878026/183650081-4f3d9fe8-9a8c-4e99-9d32-e9163e8853b5.png)  
[그림 24] 바람센서 아두이노 코드  
* 바람센서를 연결하고 작동시킨 결과이다.
* 바람을 세게 불수록 WindSpeed의 값이 올라간다.
* 아두이노 코드는 [그림 24]와 같다.    
## 3.2-3) 소리센서 구매 및 작동 결과  
![noname25](https://user-images.githubusercontent.com/51878026/183650082-57f2c15e-a66d-4184-a5e8-ad632b328e3e.png)    
[그림 25] 소리센서 구매 내역  

* 3.2-2)의 바람센서는 결과상으로는 문제가 없어 보이지만, 실제 측정 시 어느 정도 이상의 세기의 바람이 감지 되어야 수치가 올라가는 현상과, 가만히 있어도 계속 바람이 불고 있다는 높은 수치로 나오는 문제가 있었다.
* 바람센서와 브레드보드 사이에는 점퍼 케이블로 연결하였는데, 살짝 헐렁한 느낌이 있었다.
* 우리는 점퍼 케이블과 바람센서간의 연결이 완벽히 되지 않아서 납땜을 해야 해결 될 문제로 판단하였다.
* 그래서 정상적인 호흡 감지를 위해 소리센서를 구매하였다.  

![noname26](https://user-images.githubusercontent.com/51878026/183650085-4f92935c-b12a-426c-a31a-0cb70fa3650c.png)  
```
        [그림 26] 바람센서를 착용한 아두이노  
```

![noname27](https://user-images.githubusercontent.com/51878026/183650111-ed2bef06-d1e8-419d-8a52-7cfee4c8c606.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![noname28](https://user-images.githubusercontent.com/51878026/183650117-8461f5b9-42bc-475e-a3c4-bafb38ff2c24.png)
```
    [그림 27] 소리센서 작동 결과                        [그림 28] 소리센서 아두이노 코드
``` 

* [그림 26]은 소리센서(빨간색 부품) 를 착용시킨 아두이노의 모습이다.
* 소리센서를 작동한 결과 [그림 27]과 같이 나왔다. 박수를 치거나 콧바람을 센서에 닿게 하면 크기가 높게 측정되었다.
* 소리센서 코드는 [그림 28]와 같다.
* 아래는 무호흡 감지를 하도록 수정한 결과이다.  
![noname29](https://user-images.githubusercontent.com/51878026/183650121-62545e7c-420f-4c69-9f88-7ef49ac5679d.png)  
[그림 29] 수정된 소리센서 결과  
![noname30](https://user-images.githubusercontent.com/51878026/183650122-354ea543-d6aa-4caa-ad6e-0643b123ad8e.png)
![noname30_1](https://user-images.githubusercontent.com/51878026/183650125-828a3724-ebef-4402-a6ad-4beb50efd56d.png)  
[그림 30] 수정된 아두이노 코드  
* [그림 30]은 어느정도 이상의 소리센서 값이 감지되면, 호흡을 하고있고, 그 미만이 감지되면 수면 무호흡증이라고 판단을 하도록 하는 아두이노 코드이다.
* [그림 30]에서 value가 호흡 임계값이다. 41로 설정해두었고, [그림 29]을 보면 1초동안 41 이상의 값이 감지되지 않아서 “hm10.println("AT+MINO0x0001")” 가 출력되고 있다.
* 여기서 “AT+MINO”는 HM-10 모듈로 Minor ID를 변경하는 신호를 보낸다는 뜻이고 0X0001은 1 이라는 뜻이다. Minor ID를 1로 변경하겠다는 뜻이다.
* Minor ID는 비콘을 구분하는 역할을 한다.
