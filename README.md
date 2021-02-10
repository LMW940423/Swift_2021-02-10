# Swift_2021-02-10

* 애플이 싫어하기 때문에 우회하는 방법
Cocoapods 사용시에는 프로젝트 만들기만하고 종료 후(완전 종료) 터미널
- => 해당 프로젝트로 이동 후 pod init
- => Podfile 생성됐는지 확인
- => Podfile을 텍스트 편집기로 연다. 

# Uncomment the next line to define a global platform for your project

# platform :ios, '9.0'

target 'Kanna_01' do

  # Comment the next line if you don't want to use dynamic frameworks
  
  use_frameworks!

  # Pods for Kanna_01
  
  pod 'Kanna','~>5.0.0' <== 이부분에 사용할 pod을 쓴다

end

- => 터미널  pod install
- => xcode로 xcworkspace를 연다
- => import Kanna 확인


- Quiz_17 => pickerView + tableView + navigation
- Quiz_18 => Kanna를 이용한 크롤링, 데이터 가져와 표시하기

- Kanna_01 => Kanna를 이용해 변수를 잘라내기
- Kanna_02 => Kanna를 이용해 html파일을 분석
- Kanna_03 => Kanna를 이용해 웹사이트 크롤링
- xpath는 해당 링크 => copy => copy path
- 정확한 xpath를 찾고자 할 때는 파이썬이 유용하다.

- Kanna_04 => Kanna를 이용해(클래스 이용) tableView 리스트 표시 + Alert을 이용한 데이터 받기 + protocol
