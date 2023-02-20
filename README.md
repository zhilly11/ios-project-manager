# 🗂 프로젝트 매니저
<br>

## 📜 목차
1. [프로젝트 및 개발자 소개](#-프로젝트-및-개발자-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [키워드](#-키워드)
4. [타임라인](#-타임라인)
5. [화면 구조](#-화면-구조)
6. [실행화면](#-실행-화면)
7. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
8. [프로젝트 수행 중 핵심 경험](#-프로젝트-수행-중-핵심-경험)

<br>

## 🗣 프로젝트 및 개발자 소개
>소개: 프로젝트를 진행할 때 활용할 수 있는 `iPad` 전용 **ToDoList** 앱입니다.
프로젝트 기간 : 2023-01-30 ~ 2023-02-05
리뷰어 : 라이언 [@ryan-son](https://github.com/ryan-son)

|[@zhilly](https://github.com/zhilly11)|
|:---:|
|<img src = "https://i.imgur.com/LI4k2B7.jpg" width=300 height=300>|


<br>

## ⚙️ 개발환경 및 라이브러리
[![iOS](https://img.shields.io/badge/iOS_Deployment_Target-14.1-blue)]()
[![swift](https://img.shields.io/badge/Swift-5-orange)]()
[![SwiftLint](https://img.shields.io/badge/SwiftLint-SwiftLint-g)]()

<br>

## 💡 키워드

- `UIKit`
- `MVVM`
- `iPad`

<br>

## 🕖 타임라인

### STEP 1 - [23.01.09 ~ 23.01.11]
- Project 적용기술 채택
- SwiftLint 적용

### STEP 2 - [23.01.12 ~ 23.01.20]
- List View 구현
- List ViewModel 구현
- Custom Cell 구현
- Custom Table HeaderView 구현
- Context Menu 구현

### STEP 3 - [23.01.24 ~ 23.01.30]
- CoreData 구현
- 수정기록을 확인할 수 있는 기능 구현
- 코드 리팩토링

<br>

## 🖥️ 화면 구조

![](https://i.imgur.com/6yqUTHS.png)


<br>

## 💻 실행 화면

| 메인 화면 |
| :--------: |
| ![](https://i.imgur.com/9eVtmNs.png)     |

| 추가, 수정 화면 |
| :--------: |
| ![](https://i.imgur.com/YvzFnZT.png)     |

| 수정내용 확인 화면 |
| :--------: |
| ![](https://i.imgur.com/wGJTEuh.png)     |



<br>

## 🎯 트러블 슈팅 및 고민

### ViewModel Binding 방법
- 외부라이브러리 없이 구현해야하는 상황에서 Binding을 어떤식으로 진행해야할지 고민이 들었습니다.
- 클로저, 노티피케이션 등등 여러 방법이 있지만 클로저를 통해서 저장되는 값이 변경될 때 로직을 수행하도록 구현했습니다.

### ViewModel에 대한 고민
- 현재의 List ViewModel은 1개를 이용하고 있습니다.
- 1개의 ViewModel안에 3개의 Ovservable한 model 3개를 사용하여 구현을 했습니다.
- ViewModel과 View가 1:3의 구조를 가지도록 구현을 했습니다.
- 하나의 ViewModel에서 데이터를 관리하니 사용측면에서는 편리했습니다.
- 하지만 이렇게 구현하게 되니 각각의 ViewController에서 필요한 데이터를 요청할 때 ViewModel에서 계속 분기처리를 해줘야 하는 번거로움이 생겼습니다.
- 또한 ViewModel이 Cell의 데이터도 담당하고 있게 되었습니다.
- ViewModel을 조금 더 효율적으로 설계할 수 있는 방법을 고민해 봐야할 것 같습니다.
<br>

## 💡 프로젝트 수행 중 핵심 경험

- MVVM 아키텍처 구현
- 클로저를 이용한 Observable한 모델 구현
- Date Picker를 통한 날짜 입력
- Swipe Action을 통한 삭제 구현
- CoreData를 통한 데이터 CRUD 구현
- PopoverView에 대한 이해와 활용
- Context Menu에 대한 이해와 활용

<br>
