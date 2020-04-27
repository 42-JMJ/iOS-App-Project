<p align="center"><img src="https://user-images.githubusercontent.com/60066472/79683572-0deafb00-8266-11ea-9ec5-d41af1777283.jpg"></p>

## 기획의도
- 나를 제일 잘 아는 사람이 나라고 합니다
- 하지만 "나는 나를 잘 알고있는가?"라는 질문에 자신있게 "그렇다"라고 대답할 수 있는 사람이 얼마나 될까요?
- 스스로를 잘 알기에는 우리에게는 자신이 어떤 사람인지 탐구할 수 있는 시간도, 기회도 부족한 걸지도 모르겠습니다.
- 하루에 한 번 정도는 나에 대해 집중해서 알아보는 시간을 가져보는 것은 어떨까요?
<br>

## 기능정의
- 바쁜 일상으로 미처 관심을 주지 못했던 '나'에 대해 알아가는 시간을 가질 수 있도록 매일 하나씩 '나'에 관한 질문을 던지고 생각나는 답변을 바로바로 저장할 수 있는 어플
<br>

## 팀소개
안녕하세요! <br>
아이폰앱 한번 만들어보고싶은 비전공자 3명이서 뭉쳤습니다. 즐겁게 만들어보려고 합니다. <br> 잘 부탁드립니다! :pray:
- __팀명 : JMJ__
    - 세 명의 인트라아이디 앞 글자에서 따옴. '재밌자'고 모인 팀

- __팀원__
    - :boy: __고재두__ [_(nadarm)_](https://github.com/nadarm) - :crown: 팀장
    - :woman: __김미혜__ [_(365kim)_](https://github.com/365kim)
    - :man: __이준서__ [_(robolovo)_](https://github.com/robolovo)
<br>

## 개발일지
- __종합일정관리__ : 일정관리표<a href="https://docs.google.com/spreadsheets/d/1o80Ur49F_Hm6ibgiPySKHxe3YAOeO5k74K-_U3TpR24/edit?usp=sharing" target="_blank"> _(새탭으로 열기)_ </a>

#### :cherries: 4월 24일 (금)
- Xcode 11에서 스토리보드간 이동 시 화면 전환이 full screen이 아니라 모달로 보이는 문제
    - 특히 list view로 이동할 때는 모달로 보이면 안되므로 수정 필요
- 프로젝트 재생성 및 PR/Merge완료 __(#10)__
    - 코드리뷰를 하기위해 PR내용을 로컬로 가져오는 명령어
        1. `git checkout master` 
        2. `git fetch` 
        3. `git checkout -t origin/develop`
- 데이터관리를 위한 sql 기초학습 필요
    - [생활코딩:데이터베이스](https://opentutorials.org/course/195/1467)
    - [생활코딩:SQL](https://opentutorials.org/course/195/1400)

#### :cherries: 4월 23일 (목)
- Sub스토리보드 배정 __(#7)__
    - 준서 Sub1 / 재두 Sub2 / 미혜 Sub3 사용
- 데이터베이스 단위 설계 __(#13)__
    - 가능한 방법
        - 1번 : 날짜와 질문을 미리 매칭시켜두는 방법
        - 2번 : 날짜는 날짜대로 출력하고 질문은 목록에서 그 다음 질문을 가져오는 방법
    - 1번 방법으로 결정
        - 1번은 나중에 공유하는 기능을 추가할 경우, 같은 질문에 대한 답변을 공유할 있다는 점에서 유리하기 때문
- 스트럭트 vs 클래스 차이점
    - 스트럭트는 값을, 클래스는 레퍼런스를 전달
    - [참조:Swift struct vs. class 차이점 비교 분석](https://www.letmecompile.com/swift-struct-vs-class-%EC%B0%A8%EC%9D%B4%EC%A0%90-%EB%B9%84%EA%B5%90-%EB%B6%84%EC%84%9D/)
- 날짜 표현 방법이 다양한 문제
    - 문제 시 추후 재논의
- 유용한 링크 공유
    - [[부스트코스] 기상정보 애플리케이션](https://www.edwith.org/boostcourse-ios/joinLectures/12973)
    - [swift문법 - 영상](https://www.youtube.com/watch?v=nGzI_JSzUps&list=PLJqaIeuL7nuEEROQDRcy4XxC9gU6SYYXb&index=31)
    - [메모앱 만들기 - 영상](https://www.youtube.com/watch?v=muR6DJ3hcQo&list=PLziSvys01OemZoYotSrwUVx_CbZUF7v17&index=7)

#### :cherries: 4월 22일 (수)
- 테스틀 위한 시뮬레이터 실행 시 속도저하 문제
    - 실기기 연결해서 테스트해서 해결
- 데이터를 두개 이상 넘겨보내는 방법
    - 데이터 단위를 하나로 묶어서 전달
- 코코아팟 및 렘 설치 __(#6)__
    -  `sudo gem install cocoapods`
    - `pop init`
    - `pod repo update`
    - `vi Podfile` Podfile 수정
    - `pod install`
    - 코코아팟을 이용하면 렘 을 repo에 통째로 올리지 않아도 됨

#### :cherries: 4월 21일 (화)
- 프로젝트 기한 ~5/8(금) 에서 ~5/10(일)로 변경
- 정기미팅에서 각자 진행상황 + 알게된 것 공유
    - 매일 오후 3시 그룹콜 + 팀뷰어 로 진행하고 참석못하면 미리 알려주기
- 개발환경 확인 및 충돌 방지를 위한 공통 파일 작성 __(#5, #7)__
    - 재두 : Mac 카탈리나 / Xcode 11
    - 미혜 : Mac 모하비 / Xcode 10.2.1
    - 준서 : Mac 하이시에라 / Xcode 10.2.1 
- 깃이그노어 추가 __(#5)__
- :gem: 깃허브 협업 룰 추가 :gem: 
    - commit 메세지는 되도록 한글로 작성합니다.
    - PR은 리뷰승인 완료 후 PR작성자가 "Merge" ~~하고 "Delete branch"~~ 합니다.
    - 리뷰는 최소 한 사람에게 받도록 합니다.
    - 리뷰어 배정(PR일 기준)
        - 짝수일 : 재두 > 미혜 > 준서 > 재두 _(준서는 재두의 리뷰를 꼭 받아야 한다)_
        - 홀수일 : 재두 < 미혜 < 준서 < 재두 _(재두는 준서의 리뷰를 꼭 받아야 한다)_
    - 이슈는 "문제점(ex. 충돌발생)"을 PR은 "해결방안(ex. 서브생성)"을 위주로 제목을 작성합니다.

#### :cherries: 4월 20일 (월)
- 이슈 생성 프로세스 숙지 __(#1)__
- 개략순서도 확정, 역할분담 __(#2)__
    - 재두 : 데이터베이스
    - 미혜 : 작성화면
    - 준서 : 목록화면(홈)
- 일정 수립 __(#3)__
<br>

## 유용한 자료모음
- [앱기획/디자인](https://github.com/42-JMJ/iOS-App-Project/wiki/4.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EC%95%B1%EA%B8%B0%ED%9A%8D--%EB%94%94%EC%9E%90%EC%9D%B8)
- [앱개발](https://github.com/42-JMJ/iOS-App-Project/wiki/4.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EC%95%B1%EA%B0%9C%EB%B0%9C)
- [데이터베이스](https://github.com/42-JMJ/iOS-App-Project/wiki/4.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4)
- [깃허브 협업](https://github.com/42-JMJ/iOS-App-Project/wiki/4.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EA%B9%83%ED%97%88%EB%B8%8C-%ED%98%91%EC%97%85-%EB%B0%8F-%EB%B2%84%EC%A0%84%EA%B4%80%EB%A6%AC)
- [버전관리](https://github.com/42-JMJ/iOS-App-Project/wiki/4.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EA%B9%83%ED%97%88%EB%B8%8C-%ED%98%91%EC%97%85-%EB%B0%8F-%EB%B2%84%EC%A0%84%EA%B4%80%EB%A6%AC)
- [코드리뷰 방법](https://github.com/42-JMJ/iOS-App-Project/wiki/4.-%EC%9C%A0%EC%9A%A9%ED%95%9C-%EC%9E%90%EB%A3%8C%EB%AA%A8%EC%9D%8C#seedling-%EC%BD%94%EB%93%9C%EB%A6%AC%EB%B7%B0)
