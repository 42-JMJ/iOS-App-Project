# 내 맘대로 수정해보기용 fork repo


![bnnr](https://user-images.githubusercontent.com/60066472/81475533-df9a8300-9247-11ea-91c1-65b75a4253ab.png)

## ☕ 기획의도
- 나를 제일 잘 아는 사람이 나라고 합니다
- 하지만 "나는 나를 잘 알고있는가?"라는 질문에 자신있게 "그렇다"라고 대답할 수 있는 사람이 얼마나 될까요?
- 스스로를 잘 알기에는 우리에게는 자신이 어떤 사람인지 탐구할 수 있는 시간도, 기회도 부족한 걸지도 모르겠습니다.
- 하루에 한 번 정도는 나에 대해 집중해서 알아보는 시간을 가져보는 것은 어떨까요?

<br>

## ☕ 1일1답
- __iOS앱 개발 프로젝트__
- __기능정의__
    - 매일 하나씩 '나'에 관한 질문이 주어지고 생각나는 답변을 바로바로 기록할 수 있는 어플
    - 바쁜 일상으로 미처 관심을 주지 못했던 '나'에 대해 알아가는 시간을 가질 수 있도록 함
    ![dgrm](https://user-images.githubusercontent.com/60066472/81477696-fcd54e80-9253-11ea-929b-67f8b4cdf9ae.png)
- __프로젝트명 : 1일1답__
    - Program42 팀구성 단계에서 가칭으로 사용하던 "1일1답"이 앱의 기능을 충실하게 나타낸다고 생각해서 계속 사용하기로 함
<br>

## ☕ 개발환경
- __개발도구__ : Xcode (ver 10.2.1 - 11)
- __사용언어__ : Swift
- __D B M S__ : SQLite
- __개발방식__
    - 상황에 따라 유동적으로 역할을 분담
    - 자체 [협업컨벤션](https://github.com/42-JMJ/iOS-App-Project/wiki/%ED%98%91%EC%97%85-%EC%BB%A8%EB%B2%A4%EC%85%98#gem-%EA%B9%83-%EC%BB%A8%EB%B2%A4%EC%85%98)에 따라 상호 코드리뷰 수행
- __협업도구__
    - 소스공유 : Github
    - 일일 정기회의 : Slack, Teamviewer
    - 수시 의견공유 : Kakaotalk
    - 전체 일정관리 : Googledocs <a href="https://docs.google.com/spreadsheets/d/1o80Ur49F_Hm6ibgiPySKHxe3YAOeO5k74K-_U3TpR24/edit?usp=sharing"> (Ctrl+클릭) </a>

<br>

## ☕ 실행방법
```
git clone https://github.com/42-JMJ/iOS-App-Project.git OneDayOneAnswer
```
- Xcode 에서 "OneDayOneAnswer" 프로젝트 열기
- 시뮬레이터 실행 (좌측상단 ▶ 버튼)
<br>

## ☕ 개발일지
<details>
<summary> 1주차 회의록  (눌러서 내용보기) </summary>
<div markdown="1">

## :cherries: 4월 20일 (월)
#### 끝냈습니다
- 오늘부터 정기적으로 온라인미팅 시행
    - 매일 오후 3시 그룹콜 + 팀뷰어 로 진행하고 참석못하면 미리 알려주기
    - 각자 진행상황 + 알게된 것 공유하기 위함
- 깃허브 협업환경 설정
    - Issue 생성 프로세스, kanban보드 관리방법 등 토의 및 정리 __([#1](https://github.com/42-JMJ/iOS-App-Project/issues/1))__
- 개략순서도 확정하고 역할분담 __([#2](https://github.com/42-JMJ/iOS-App-Project/issues/2))__
    - 순서도는 프로젝트 진행하면서 수정될 수 있음
    - 재두 : 데이터베이스 관리
    - 미혜 : Today화면
    - 준서 : List화면
- [Googledocs](https://docs.google.com/spreadsheets/d/1o80Ur49F_Hm6ibgiPySKHxe3YAOeO5k74K-_U3TpR24/edit?usp=sharing)로 전체일정 수립 __([#3](https://github.com/42-JMJ/iOS-App-Project/issues/3))__
<br>

## :cherries: 4월 21일 (화)
#### 끝냈습니다
- 충돌 방지를 위한 공용의 프로젝트 작성 __(#5, #7)__
    - 개발환경 확인
        - 재두 : Mac 카탈리나 / Xcode 11
        - 미혜 : Mac 모하비 / Xcode 10.2.1
        - 준서 : Mac 하이시에라 / Xcode 10.2.1
    - 재두 환경(상위 버전)에서 프로젝트 생성 후 미혜/준서 환경(하위 버전)에서 open 시 충돌 발생
        - 미혜/준서 환경(하위 버전)에서 프로젝트 생성해서 작업 진행
- 깃이그노어 추가 __([#4](https://github.com/42-JMJ/iOS-App-Project/pull/4))__
- :gem: 깃허브 협업 룰 추가 :gem:
    - commit 메세지는 되도록 한글로 작성합니다.
    - PR은 리뷰승인 완료 후 PR작성자가 "Merge" ~~하고 "Delete branch"~~ 합니다.
    - 리뷰는 최소 한 사람에게 받도록 합니다.
    - 리뷰어 배정(PR일 기준)
        - 짝수일 : 재두 > 미혜 > 준서 > 재두 _(준서는 재두의 리뷰를 꼭 받아야 한다)_
        - 홀수일 : 재두 < 미혜 < 준서 < 재두 _(재두는 준서의 리뷰를 꼭 받아야 한다)_
    - 이슈는 "문제점(ex. 충돌발생)"을 PR은 "해결방안(ex. 서브생성)"을 위주로 제목을 작성합니다.
#### 고민입니다
- 프로젝트 기한 ~5/8(금) 에서 ~5/10(일)로 변경된 점 고려해서 전체일정도 변경
<br>

## :cherries: 4월 22일 (수)
#### 배웠습니다
- 데이터를 두개 이상 넘겨보내는 방법
    - 데이터 단위를 하나로 묶어서 전달
- 코코아팟 및 렘 설치 __([#6](https://github.com/42-JMJ/iOS-App-Project/issues/6))__
    -  `sudo gem install cocoapods`
    - `pop init`
    - `pod repo update`
    - `vi Podfile` Podfile 수정
    - `pod install`
    - 코코아팟을 이용하면 렘 을 repo에 통째로 올리지 않아도 됨
#### 고민입니다
- 테스트를 위한 시뮬레이터 실행 시 속도저하 문제
    - 실기기 연결해서 테스트해서 해결
<br>

## :cherries: 4월 23일 (목)
#### 끝냈습니다
- Sub스토리보드 배정 __([#7](https://github.com/42-JMJ/iOS-App-Project/pull/7))__
    - 준서 Sub1 / 재두 Sub2 / 미혜 Sub3 사용
- 데이터베이스 단위 설계 __([#13](https://github.com/42-JMJ/iOS-App-Project/issues/13))__
    - 가능한 방법
        - 1번 : 날짜와 질문을 미리 매칭시켜두는 방법
        - 2번 : 날짜는 날짜대로 출력하고 질문은 목록에서 그 다음 질문을 가져오는 방법
    - 1번 방법으로 결정
        - 1번은 나중에 공유하는 기능을 추가할 경우, 같은 질문에 대한 답변을 공유할 있다는 점에서 유리하기 때문
#### 배웠습니다
- 스트럭트 vs 클래스 차이점
    - 스트럭트는 값을, 클래스는 레퍼런스를 전달
    - [참조:Swift struct vs. class 차이점 비교 분석](https://www.letmecompile.com/swift-struct-vs-class-%EC%B0%A8%EC%9D%B4%EC%A0%90-%EB%B9%84%EA%B5%90-%EB%B6%84%EC%84%9D/)
- 유용한 링크 공유
    - [[부스트코스] 기상정보 애플리케이션](https://www.edwith.org/boostcourse-ios/joinLectures/12973)
    - [swift문법 - 영상](https://www.youtube.com/watch?v=nGzI_JSzUps&list=PLJqaIeuL7nuEEROQDRcy4XxC9gU6SYYXb&index=31)
    - [메모앱 만들기 - 영상](https://www.youtube.com/watch?v=muR6DJ3hcQo&list=PLziSvys01OemZoYotSrwUVx_CbZUF7v17&index=7)
#### 고민입니다
- 날짜 표현 방법이 다양한 문제
    - 문제 시 추후 재논의
<br>


## :cherries: 4월 24일 (금)
#### 끝냈습니다
- 협업환경에 맞춘 프로젝트 재생성 및 PR/Merge완료 __([#15](https://github.com/42-JMJ/iOS-App-Project/pulls?q=is%3Apr+is%3Aclosed))__
#### 배웠습니다
- 내 브랜치를 최신화 하는 명령어
    1. `git checkout master`
    2. `git pull`
    3. `git checkout feature/develop`
    4. `git merge master`
- 코드리뷰를 하기위해 PR내용을 로컬로 가져오는 명령어
    1. `git checkout master`
    2. `git fetch`
    3. `git checkout -t origin/develop`
#### 고민입니다
- Xcode 11에서 스토리보드간 이동 시 화면 전환이 full screen이 아니라 모달로 보이는 문제
    - 특히 list view로 이동할 때는 모달로 보이면 안되므로 수정 필요
- 데이터관리를 위한 sql 기초학습 필요
    - [생활코딩:데이터베이스](https://opentutorials.org/course/195/1467)
    - [생활코딩:SQL](https://opentutorials.org/course/195/1400)
<br>

</div>
</details>


<details>
<summary> 2주차 회의록 (눌러서 내용보기) </summary>
<div markdown="1">

## :lemon: 4월 27일 (월)
#### 끝냈습니다
- 1주차 진도평가(양호) 및 2-3주차 일정검토
- 프로그램참여 신청명단에 누락된 상황 조치
    - 스태프님께 문의해서 Program42 슬랙채널 초대받고 Googledocs 명단에 JMJ팀 추가 (O)
    - 슬랙-깃허브 연동 및 [README.md 양식]((https://github.com/42seoul-jonghun/program42_test_sample/blob/master/README.md
))에 맞게 수정 (O)
- 온라인 중간미팅 주제 관련 사전 논의 (이번주 수요일 @13:42, Zoom)
- 온라인 중간미팅 참석대상자 문의
    - 답변내용: 팀장 필참, 팀원은 선택
- Today.Storyboard 구현 __([#20](https://github.com/42-JMJ/iOS-App-Project/pull/20))__
    - 작성날짜(오늘날짜) 표시
    - placeholder 표시/감추기
    - 텍스트뷰 외 터치 시 키보드 감추기
#### 배웠습니다
- 시뮬레이터 녹화하는 방법 📷
    - 터미널에 입력 `xcrun simctl io booted recordVideo ~/simulator.mov`
#### 고민입니다
- 목표한 기능을 한번에 PR할 경우 (ex.목요일에 한번) 코드가 길어져 원활한 리뷰가 어렵고, 또 격일로 reviewer가 바뀌기 때문에 격일로 PR할 경우 한명에게만 리뷰를 받는 문제가 발생
   - :gem: 깃허브 협업 룰 추가 :gem: 해서 해결
        - 당일 작업사항은 당일에 꼭 PR합니다
- vnc환경에서는 Cocoapods 설치가 안되는 문제 발견
    - Realm 대체 데이터베이스 관리시스템 선택해야 함
    - 대체할 프로그램으로 Core Data, SQLite 검토
<p><img src="https://user-images.githubusercontent.com/60066472/80346978-9e4cbf80-88a6-11ea-8d5c-ad0c9fb4906e.png"></p>
<br>

## :lemon: 4월 28일 (화)
#### 끝냈습니다
- Realm 대체할 프로그램으로 Core Data, SQLite 중 SQLite 선택
    - SQLite는 다양한 운영체제 환경에서 사용할 수 있음
    - SQLite로 인해 생성되는 각 데이터베이스는 하나의 파일로 구성되어 관리가 용이함
    - 주로 개발용 및 소규모 프로젝트에 적합함
- 런치스크린 관련 저작권 확인
    - dx시인과나 폰트 비상업적 용도로 사용가능한 것으로 [ 확인완료 ](http://www.dxkorea.co.kr/shop/main/html.php?htmid=proc/font_demo.htm)
    - Unplash(사진공유웹사이트)의 이미지파일 비상업적 용도로 사용가능한 것으로 [ 확인완료 ](https://unsplash.com/license)
![set](https://user-images.githubusercontent.com/60066472/80553217-f947f900-8a03-11ea-859d-f650936c7187.png)
- 런치스크린 시안 공유 __([#24](https://github.com/42-JMJ/iOS-App-Project/issues/24))__
- DataBase protocol과 Article struct 선언 ([#23](https://github.com/42-JMJ/iOS-App-Project/pull/23))
    - id / date / question / answer로 구성
- Today.Storyboard 구현 __([#25](https://github.com/42-JMJ/iOS-App-Project/pull/25))__
    - 텍스트뷰가 비어있지 않을때만 저장버튼 활성화
#### 배웠습니다
- 런치스크린에서도 custom font 적용시키는 방법 (by 준서)
    - imageView에서 View-Content Mode에서 아무거나 다른 옵션 선택 후 다시 원래 옵션 선택하면 적용됨
#### 고민입니다
- 런치스크린 디자인시안 다 좋아서 고민
    - 언제든 수정이 가능하니 우선 준서가 하나 골라서 master에 올려놓기로 함
    - 전체 View의 통일성을 위해 런치스크린에서 사용한 font를 다른 View에도 적용해야함
- displayView 추가 고려
    - 답변 작성하는 화면보다 더 깔끔하게 내용을 확인할 수 있고, 작성이 끝난 나의 답변을 제 3의시각으로 다시 볼 수 있는 기회도 됨
        - (변경 전) 답변작성->저장버튼->ListView로 전환
        - (변경 후) 답변작성->저장버튼->displayView로 전환
    - 사용자가 질문 또는 답변에 어울리는 이미지를 선택해서 배경화면을 꾸밀 수 있는 기능도 추가로 접목한다면 더욱 다양한 경험을 제공할 수 있음
    - 다음주에 구현해볼 수 있을 것으로 예상되나 우선 진행중인 기능 구현 마무리되면 다시 논의
- "(0/500자)"와 같이 현재 작성된 글자수 및 전체 글자수를 알려주는 기능 추가 고려
    - 글자수 제한은 기능상 필요하지 않아 전체 작성한 글자수만 보여주는 기능도 괜찮을 듯함
    - 역시 우선 진행중인 기능 구현 마무리되면 재논의
- 질문목록을 db 담아서 사용하는 방법 고민
    - 가능한 경우
        - 1번: 서버에서 db를 받아와서 사용하는 방법
        - 2번: 파일을 앱에 넣고 db를 사용하는 방법
    - 2번으로 결정
        - 2번의 경우 앱을 업데이트 할때까지 질문이 바뀌지 않지만 미리 충분한 질문 pool을 확보해논 상태라면 서버없이 구현할 수 있기 때문에 2번으로 결정
<br>

## :lemon: 4월 29일 (수)
#### 끝냈습니다
- @1:42 온라인 중간미팅
    - 제출 후 평가방법 문의 답변내용: 온라인 평가로 진행
    - 간단한 기능부터 우선 구현하고 add-on 형식으로 붙여나가서 성취감을 가질 수 있도록 추진
- 테스트용 db 구현 완료 __([#27](https://github.com/42-JMJ/iOS-App-Project/pull/27))__
- List 스토리보드 디자인 구현 완료 __([#28](https://github.com/42-JMJ/iOS-App-Project/pull/29))__
- 런치스크린 구현 완료 __([#29](https://github.com/42-JMJ/iOS-App-Project/pull/29))__
#### 배웠습니다
- 터미널에서 스위프트 버전 확인하는 명령어
    - `xcrun swift --version`
- 싱글톤 디자인패턴
    - [싱글톤 패턴을 쓰는 이유](https://coding-restaurant.tistory.com/144)
#### 고민입니다
- today.storyboard와 selected.storyboard의 레이아웃이 동일함에도 중복되서 존재하는 문제
    - today.storyboard를 다시 활용하는 방법으로 변경
- 런치스크린 표시하는 시간
    - 가능한 방법
        - 1번 : 5초 정도로 길게 (현재 적용)
        - 2번 : 3초 이하로 짧게
    - 2번으로 선택
        - 넉넉한 시간동안 앱의 컨텐츠에서 추구하는 천천히 생각하는 시간을 갖는 분위기와 맞추는 것도 좋지만 너무 길면 사용자가 자칫 앱의 반응속도가 느리다는 인식을 갖거나 답답해할 수 있음
<br>

## :lemon: 4월 30일 (목)
#### 끝냈습니다
- 전체일정 중간점검 및 개별목표 공유
    - 재두 : 이번주까지 sqlite 부분 완성 목표
    - 미혜 : 이번주까지 today.storyboard 완성 목표
    - 준서 : 이번주까지 list.storyboard완성 목표
- Today.Storyboard 구현 __([#30](https://github.com/42-JMJ/iOS-App-Project/pull/30))__
    - ListView에서 cell 선택시 새로운 view로 연결하지 않고 기존의 TodayView 활용하도록 변경
    - db연동해서 select함수로 질문 가져오기
    - 회의때 얘기했던 스크롤 위치, 테두리 색상 등 반영
- 리드미파일 및 위키 현행화 완료 __([#33](https://github.com/42-JMJ/iOS-App-Project/pull/33))__
    - 스태프분들/멘토분들께서 진행상황 보실 수 있도록 "매주 목요일 23:59까지 기록"
    - 온라인 미팅때 리드미에 모든 것을 기록하기보다 목적에 맞게 작성하는게 좋다는 조언 참고
#### 배웠습니다
- 리드미파일 작성목적 및 포함사항(권장)
    - What kind of project it is
    - How it can be useful
    - How to install and use it
    - List of authors
    - Guidelines for contributing
    - License notice
    - Whatever else the developers would want other people to read.
    - 참조: [purpose of readme](https://www.quora.com/What-is-the-purpose-of-readme-file-on-GitHub)
#### 고민입니다
- 최종제출 때 보여줄 매개체
    - 꼭 영상을 제출 해야되는건 아니지만 프로토타입 보여줄 매개체 필요(영상제출 관련 문의 답변내용, 4/29 온라인 미팅)
    - 시뮬레이터로 촬영하는 방법이 효과적?
    - 다른 어플 프로모션 영상 찾아보기
<br>

## :lemon: 5월 1일 (금)
#### 끝냈습니다
- DB관련 자주 쓰이는 함수 추가 __([#35](https://github.com/42-JMJ/iOS-App-Project/pull/35))__
    - Date를 String으로, String을 Date로 변환하는 유틸 함수 추가
- Today.Storyboard 구현 __([#40](https://github.com/42-JMJ/iOS-App-Project/pull/40))__
    - alert함수작성 및 doAction()에서 ListView로 연결되지 않던 문제 해결
    - 사용자 답변 작성내용을 db에 update()하는 btnSaveTouchOn함수 작성
    - animate 효과 추가 (회의에서 의견나누고 다시 수정)
#### 배웠습니다
- Swift 5.1의 Self키워드 기능 [참조](https://seorenn.tistory.com/27)
    - `Self` : 자기 자신의 동적 클래스(dynamic class)를 가리키는 키워드
    - Swift 5.1에서는 상속받은 클래스에서 정의하는 class 멤버를 참조할 수 있도록 Self 키워드에 능력 추가됨
    - 단, Swift 5.0에서는 Self를 사용하면 컴파일 에러가 뜨므로 `Self.`이 아닌 `클래스명.`으로 작성해주어야 함
#### 고민입니다
- 매일 짝수/홀수일별로 PR리뷰어가 바뀌어서 헷갈리는 문제
    - PR템플릿 추가 __([#38](https://github.com/42-JMJ/iOS-App-Project/pull/38))__ 해서 해결
    - PR작성 화면에서 자체 깃컨벤션에 따른 리뷰어를 자동으로 안내해주는 유용한 기능!
- 3주차 과제 설정 및 역할분담
    - 현재 각자 진행하고 있는 사항을 모두 완료한다면 그 다음 우선 구현해야할 사항은 DisplayView
    - DisplayView를 2~3명이서 쪼개서 구현하기에는 작업단위가 애매함
    - 월요일까지 진행상황 보고 다시 고민

</div>
</details>

<details>
<summary> 3주차 회의록 (눌러서 내용보기) </summary>
<div markdown="1">

## :watermelon: 5월 4일 (월)
### 끝냈습니다
- 2주차 진도평가(양호) 및 3주차 일정검토
- 지금까지 나온 아이디어 검토해서 그 중 add-on할 것 DisplayView로 결정 [ __(#42)__ ](https://github.com/42-JMJ/iOS-App-Project/issues/42)
    - 이유: 나온 아이디어 중 가장 어렵고 배울 것이 많아보여서
    - DisplayView 반영해서 화면순서도 변경 [ __(#44)__ ](https://github.com/42-JMJ/iOS-App-Project/issues/44)
- List스토리보드 구현 [ __(#45)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/45)
    - indexPath를 이용해 날짜순 정렬(db연동)
    - 오늘날짜 이후의 질문은 목록에 표시되지 않도록 숨기고, 커스텀셀의 디자인도 개선함
- 이미지 파일 불러오는 함수 구현 [ __(#47)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/47)
    - 로컬/번들에 있는 이미지를 불러오는 함수
    - 파일 내용을 가져오는 함수
### 고민입니다
- DB에 이미지를 저장하는 방법?
    - 일단 sqlite3에 이미지 저장이 가능한 것은 확인되었음
    -  그런데 추가될 때마다 저장하면 똑같은 이미지가 중복되어 저장될 수 있어 메모리 낭비가 발생할 수 있음
- modal창에서 "기본이미지 제공"으로 할지, "갤러리에서 가져오기"로 할지 혹은 둘 다 할지 고민
    - 이미지피커를 이용하면 포토앨범에서 사진을 고르는 것은 가능하지만 기본이미지 제공은 할 수 없음...
    - `UIImagePickerController`: 카메라로 사진을 찍거나 앨범에서 가져오는 방법으로 이미지를 추가할 수 있도록 해주는 피커
- Display스토리보드 하나의 View를 3명이서 어떻게 역할분담해서 구현할지 고민
    - 미혜 _(예상난이도 중급)_
        - Today에서 받아온 article 표시하고 테스트용 이미지로 Display 레이아웃 구성
        - show UIImageView해주고 이미지 저장하는 함수를 articleupdate함수와 함께 실행
    - 재두 _(예상난이도 고급)_
        - 선택된 이미지를 sqlite에 저장해주는 함수 구현
        - 해당 article의의 image값 sqlite에서 불러오는 함수 구현
        - 리소스 이미지 불러오는 함수 → 이미지와 관련된 데이터 리턴
    - 준서 _(예상난이도 고-급)_
        - 리스트로 이미지를 띄워 사용자가 고를 수 있는 modal창 구현
        - modal에서 imageView 터치 시 Today으로 이미지파일을 리턴해줌
<br>

## :watermelon: 5월 5일 (화)
### 끝냈습니다
- Today스토리보드 개선 [ __(#48)__ ](https://github.com/42-JMJ/iOS-App-Project/issues/48)
    - 코드가독성 개선, 아이콘 추가 및 전체 배치개선
    - [#43](https://github.com/42-JMJ/iOS-App-Project/issues/43) 관련 오토레이아웃 적용
- List스토리보드 디벨롭 [ __(#51)__ ](https://github.com/42-JMJ/iOS-App-Project/issues/51)
    - 사용자가 Cell 선택시 해당 Date를 넘겨주는 함수 구현
    - Table '오래된순 정렬'에서 '최신순 정렬'로 수정 및 테두리 디자인 개선
### 배웠습니다
- 데이터베이스에서 이미지 관리하는 방법
    - 이미지를 특정 폴더에 저장해두고, DB에는 이미지의 경로를 저장 [(참고: 야곰닷넷 QnA)](https://yagom.net/forums/topic/%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%A0%80%EC%9E%A5-%EB%82%B4%EB%B6%80db-%EC%A7%88%EB%AC%B8-%EB%93%9C%EB%A6%BD%EB%8B%88%EB%8B%A4-2/)
<br>

## :watermelon: 5월 6일 (수)
### 끝냈습니다
- ImagePicker로 modal화면 구현 [ __(#55)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/55)
    - 버튼을 누르면 modal창에 띄워진 갤러리에서 사용자가 원하는 사진을 골라 배경화면을 꾸밀 수 있는 기능
- Display스토리보드 기본틀 구현 [ __(#56)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/56)
    - 전체 레이아웃(스크롤 뷰) 설정하고 필요한 asset 추가
- 해당 날짜에 배정된 질문이 아니라 무조건 첫번째 질문이 주어지던 이슈 해결 [ __(#59)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/59)
- 답변작성내용이 있는 경우에도 placeholder가 뜨던 이슈 해결 [ __(#61)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/61)
### 배웠습니다
- 터미널에서 Xcode버전 확인하기
    - `xcodebuild -version`
- Xcode 버전이 같아도 Swift버전이 다를 수 있고, 그럴 경우 시뮬레이터 실행결과도 다르게 보일 수 있음
### 고민입니다
- 한글에는 word-wrap 옵션이 적용안되는데 뚜렷한 해결방법을 못찾아서 고민 [ __(#57)__ ](https://github.com/42-JMJ/iOS-App-Project/issues/57)
- 현재 커스텀폰트 세가지가 혼용되고 있어 하나로 통일할 필요가 음
    - dx시인과나(런치스크린에 사용) vs 경기바탕체 vs 마포꽃섬체
- 이번주에 추가된 Display뷰 _(하단그림: 왼쪽)_ 와 흰색바탕으로 된 기존 뷰들 _(하단그림: 오른쪽)_ 의 디자인 통일성이 떨어져서 고민
    - 가능한 방법
        - 1번: Display뷰만 수정해서 이미지를 전체화면이 아닌 삽화처럼 작게 넣는 방법
        - 2번: 나머지 뷰를 모두 다크모드(?)처럼 수정해서 적용하는 방법
    - 2번으로 결정
        - 원래 의도한 Display뷰의 느낌도 살릴 수 있고 런치스크린 디자인과도 잘 어울리기 때문
            <p><img src="https://user-images.githubusercontent.com/60066472/81186141-6f90c080-8fed-11ea-9844-db7e96c785d7.png" width=200></p>
<br>

## :watermelon: 5월 7일 (목) 프로젝트 마감 D-3!
### 끝냈습니다
- 마감을 앞두고 작업시간 확보를 위해 남은 3일 정기미팅 시작시간 조정
    - 금: 오후 5시
    - 토: 오후 8시
    - 일: 변동없음(오후 3시)
- 모든 뷰에 다크모드(?)적용하고 런치스크린과 동일한 폰트 적용해서 통일성 확보 [ __(#62)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/62)
- 변경한 내용이 없어도 의도하지 않게 alert함수가 뜨는 이슈 해결 [ __(#63)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/63)
- Program42 전체공지 확인
    - 시연 영상은 유튜브 or 구글드라이브 링크 게시
    - 일요일 23:59까지 제출완료하고 GoogleDocs에 O 표시하기
### 고민입니다
- 프로토타입 보여줄 매개체: 시뮬레이터 촬영?
    - 시뮬레이터로 촬영하면 기능을 다 보여줄 수 있을지, 편집이 필요하다면 시간내에 소화할 수 있을지 고민
    - 시뮬레이터 촬영시 시나리오 논의 (목록 5개 이상 나오게 따로 설정해야함)
- 리드미 최종적으로 어떻게 정리할지 고민
    - 시연영상 : 일요일에 찍어서 추가
    - 설치방법 또는 실행방법 : 기능이 간단한 Mobile App이라서 어디까지 어떻게 표현할지 고민
    - 스토리보드의 연결성을 간단하게 보여주는 화면흐름도? 추가할지 고민 ([참고](https://zetawiki.com/wiki/%ED%99%94%EB%A9%B4_%ED%9D%90%EB%A6%84%EB%8F%84))
    - 프로젝트를 마치며 느낀점 (개발일지 하위카테고리로?)
<br>

## :watermelon: 5월 8일 (금) 프로젝트 제출 D-2!
### 끝냈습니다
- db에 사용자가 선택한 이미지가 저장되지 않거나 표시되지 않는 버그fix [ __(#66)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/66)
- 아이폰마다 다른 화면 크기가 달라서 화면이 짤리는 이슈해결 [ __(#69)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/69)
    - 해결방법: sqlite3 bind text함수 사용시 SQLITE_TRANSIENT 사용 ([참조](https://stackoverflow.com/questions/28142226/sqlite-for-swift-is-unstable))
- 텍스트뷰에서 15 Btye 이하는 저장이 unstable한 버그fix  [ __(#70)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/70)
### 배웠습니다
- 뷰의 생명주기와 상태변화감지 메소드
    - func viewDidLoad()
        - 뷰의 추가적인 초기화 작업을 하기 좋은 시점
    - func viewWillAppear(_ animated: Bool)
        - 다른 뷰에서 되돌아오면 재호출되는 메서드, 화면이 나타날때마다 수행해야하는 작업을 하기 좋은 시점
    - func viewDidAppear(_ animated: Bool)
        - 뷰를 나타내는 것과 관련된 추가적인 작업을 하기 좋은 시점
    - func viewWillDisappear(_ animated: Bool)
        - 뷰가 생성된 뒤 발생한 변화를 이전상태로 되돌리기 좋은 시점
    - func viewDidDisappear(_ animated: Bool)
        - 뷰를 숨기는 것과 관련된 추가적인 작업을 하기 좋은 시점
        - 시간이 오래 걸리는 작업은 하지 않는 것이 좋음
    - 참고: [부스트코스뷰의 상태변화 감지 메서드](https://www.edwith.org/boostcourse-ios/lecture/16858/)
    <p align><img src="https://user-images.githubusercontent.com/60066472/81368925-08c5f100-912c-11ea-8ac0-3b31cc9a7a30.png" width=400></p>
<br>

## :watermelon: 5월 9일 (토) 제출 하루 전!
### 끝냈습니다
- App 아이콘 제작완료 [ __(#71)__ ](https://github.com/42-JMJ/iOS-App-Project/pull/71)
- 시뮬레이션 시나리오
    - __0.__ 실행
    - __1.__ 런치스크린
    - __2.__ 키보드토글&작성
    - __3.__ 저장하지않고 목록이동(얼럿)
    - __4.__ 지난질문 선택(장문 답변)
    - __5.__ 스크롤뷰
    - __6.__ 수정클릭
    - __7.__ 이미지피커실행
    - __8.__ 저장해서 반영된 것 확인?
<br>

## :watermelon: 5월 10일 (일) 제출 D-Day!
### 끝냈습니다
- 시뮬레이션 영상촬영 및 업로드
- 소감 나누고 마무리 😄😄😄

</div>
</details>
<br>

## 보다 자세한 내용은 [위키](https://github.com/42-JMJ/iOS-App-Project/wiki)를 참조해주세요!
