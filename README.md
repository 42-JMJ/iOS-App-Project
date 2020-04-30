<p align="right"><img src="https://user-images.githubusercontent.com/60066472/80683960-ee728e80-8aff-11ea-90ec-9952c591c055.png" width="250"></p>

## 프로젝트 개요
- __iOS앱 개발 프로젝트__
- __기능정의__
    - 바쁜 일상으로 미처 관심을 주지 못했던 '나'에 대해 알아가는 시간을 가질 수 있도록 매일 하나씩 '나'에 관한 질문을 던지고 생각나는 답변을 바로바로 저장할 수 있는 어플
    
- __기획의도__
    - 나를 제일 잘 아는 사람이 나라고 합니다
    - 하지만 "나는 나를 잘 알고있는가?"라는 질문에 자신있게 "그렇다"라고 대답할 수 있는 사람이 얼마나 될까요?
    - 스스로를 잘 알기에는 우리에게는 자신이 어떤 사람인지 탐구할 수 있는 시간도, 기회도 부족한 걸지도 모르겠습니다.
    - 하루에 한 번 정도는 나에 대해 집중해서 알아보는 시간을 가져보는 것은 어떨까요?

<br>

## We are...
안녕하세요! <br>
아이폰앱 한번 만들어보고싶은 비전공자 3명이서 뭉쳤습니다. 즐겁게 만들어보려고 합니다. <br> 잘 부탁드립니다! :pray:
- __팀명 : JMJ__
    - 세 명의 인트라아이디 앞 글자에서 따옴. '재밌자'고 모인 팀

- __팀원 (총 3인)__   
    - :boy: __고재두__ _jko_ ★팀장★
        - 프로젝트 총괄, 데이터베이스, 소스 개발 담당
    - :woman: __김미혜__ _mihykim_
        - 기록관리 총괄, 소스 개발 담당
    - :man: __이준서__ _junslee_
        - 디자인 총괄, 소스 개발 담당 
<br>

## 개발환경
- __개발도구__ : Xcode (ver 10.2.1 - 11)
- __협업도구__ : Github, Slack, Kakaotalk, Teamviewer
- __개발방식__ : 상황에 따라 유동적으로 역할을 분담하고 자체 협업룰에 따라 상호 코드리뷰 수행
<br>

## 개발일지
- __종합일정관리__ :  <a href="https://docs.google.com/spreadsheets/d/1o80Ur49F_Hm6ibgiPySKHxe3YAOeO5k74K-_U3TpR24/edit?usp=sharing"> Googledocs _(Ctrl+클릭)_ </a>

<details>
<summary> 1주차 개발일지 (펼치기/접기)</summary>
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
<summary> 2주차 개발일지 (펼치기/접기)</summary>
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
- Today.Storyboard 구현 ([#20](https://github.com/42-JMJ/iOS-App-Project/pull/20))
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
    - 대체할 프로그램으로 Core Data, SQLite 검토 후 SQLite 선택
<p><img src="https://user-images.githubusercontent.com/60066472/80346978-9e4cbf80-88a6-11ea-8d5c-ad0c9fb4906e.png"></p>
<br>

## :lemon: 4월 28일 (화)
#### 끝냈습니다
- 런치스크린 관련 저작권 확인
    - dx시인과나 폰트 비상업적 용도로 사용가능한 것으로 [ 확인완료 ](http://www.dxkorea.co.kr/shop/main/html.php?htmid=proc/font_demo.htm)
    - Unplash(사진공유웹사이트)의 이미지파일 비상업적 용도로 사용가능한 것으로 [ 확인완료 ](https://unsplash.com/license)
![set](https://user-images.githubusercontent.com/60066472/80553217-f947f900-8a03-11ea-859d-f650936c7187.png)
- 런치스크린 시안 공유 ([#24](https://github.com/42-JMJ/iOS-App-Project/issues/24))
- DataBase protocol과 Article struct 선언 ([#23](https://github.com/42-JMJ/iOS-App-Project/pull/23))
    - id / date / question / answer로 구성
- Today.Storyboard 구현 ([#25](https://github.com/42-JMJ/iOS-App-Project/pull/25))
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
    - 평가방법 문의 답변내용: 온라인 평가로 진행
    - 영상제출 여부 문의 답변내용: 꼭 영상을 제출해야되는건 아니지만 프로토타입 보여줄 매개체 필요
    - 간단한 기능부터 우선 구현하고 add-on 형식으로 붙여나가서 성취감을 가질 수 있도록 추진
- 테스트용 db 구현 완료([#27](https://github.com/42-JMJ/iOS-App-Project/pull/27))
- List 스토리보드 디자인 구현 완료 ([#28](https://github.com/42-JMJ/iOS-App-Project/pull/29))
- 런치스크린 구현 완료 ([#29](https://github.com/42-JMJ/iOS-App-Project/pull/29))
#### 배웠습니다
- 터미널에서 스위프트 버전 확인하는 명령어
    - 'xcrun swift --version'
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

</div>
</details>



## 유용한 자료모음
- [앱기획/디자인](https://github.com/42-JMJ/iOS-App-Project/wiki/5.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EC%95%B1%EA%B8%B0%ED%9A%8D--%EB%94%94%EC%9E%90%EC%9D%B8)
- [앱개발](https://github.com/42-JMJ/iOS-App-Project/wiki/5.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EC%95%B1%EA%B0%9C%EB%B0%9C)
- [데이터베이스](https://github.com/42-JMJ/iOS-App-Project/wiki/5.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4)
- [깃허브 협업](https://github.com/42-JMJ/iOS-App-Project/wiki/5.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EA%B9%83%ED%97%88%EB%B8%8C-%ED%98%91%EC%97%85-%EB%B0%8F-%EB%B2%84%EC%A0%84%EA%B4%80%EB%A6%AC)
- [코드리뷰 방법](https://github.com/42-JMJ/iOS-App-Project/wiki/5.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EC%BD%94%EB%93%9C%EB%A6%AC%EB%B7%B0)

