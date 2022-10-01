# Military Mobility Platform (군 모빌리티 플랫폼)
<br>
<div align="center">
    <img src="logo.png" alt="군 모빌리티 플랫폼 로고" width="300" height="300">
</div>
<center><h3>군 모빌리티 플랫폼 : Military Mobility Platform</h3></center>

><center><h3>언제 어디서나 실시간으로 군 이동수단을 공유하는 플랫폼</h3></center>

# 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [기능 설명](#기능-설명)
3. [App 구성 및 필수 조건 안내](#app-구성-및-필수-조건-안내)
4. [기술 스택](#기술-스택)
5. [설치 안내](#설치-안내)
6. [프로젝트 관리 및 개발 문서](#프로젝트-관리-및-개발-문서)
7. [팀 정보](#팀-정보)
8. [저작권 및 사용권 정보](#저작권-및-사용권-정보)

## 프로젝트 소개
### 개요
군 이동수단에 대한 배차 신청, 구난차량 요청 등 다양한 정보를 스마트폰 app을 통해 실시간으로 공유하고 관리할 수 있는 플랫폼을 구현하기 위한 프로젝트입니다. 군 이동수단의 특성 상 실시간으로 정보를 주고받아 신속하게 대응하는 것이 필요합니다.

또한 야전 현장에서는 운행 마일리지, 기록부 등을 수기로 작성하고 관리하는 방식으로 진행되고 있어서 운전병들은 자신의 운행 기록을 쉽게 조회할 수 없어 불편한 점이 있습니다.

이에 대한 문제점들을 해결하기 위해 수송업무 담당자(간부,군무원) 및 이동수단(차량) 탑승자, 운행자(직접운전 간부, 운전병)들이 모여 소통하고 군의 이동수단을 효율적으로 이용할 수 있도록 돕는 군 모빌리티 플랫폼을 고안했습니다.

군 모빌리티 플랫폼 app의 핵심 기능은 실시간 배차신청 및 확인, 안전점검 체크리스트 확인, 운행계획 작성, 사고접수 및 구난 요청, 운전병 마일리지 전산화 등 입니다.

### 기대 효과
-스마트폰 app을 통해 언제 어디서나 쉽고 간편하게 군 이동수단(차량) 관련 정보를 주고받을 수 있습니다.<br>
-운전병은 기존의 수기로 작성되던 운전병 마일리지, 운행기록부를 전산화하여 쉽게 조회/관리할 수 있습니다.<br>
-사용자(탑승자)는 사고 발생 시 신속하게 보고하고 구난차량을 요청할 수 있습니다.<br>
-수송업무 담당자는 자신이 관리하는 이동수단(차량)의 배차를 승인하고 목록을 조회하고 관리할 수 있습니다.<br>

### 발표 자료(추가 예정)

### 시연 영상(추가 예정)

[(Back to top)](#목차)

## 기능 설명

 ### 0. 로그인 / 회원가입
 #### 0-1. 로그인  
<table>
  <tr>
    <td align="center" width="50%"><img src="images/img03.png" alt="로그인" width="195" height="422" /></td>
    <td>o 기능명: 로그인<br><br>
     	o 개요: 사용자 인증을 위한 로그인 화면입니다. 아이디와 비밀번호를 입력하고 허가된 사용자만 app에 접속할 수 있습니다. <br><br>
	o 엑터명: 탑승자, 수송업무 담당자, 운전자<br><br>
	o 사전 조건: 회원 가입이 되어있어야 함.<br>
	o 사후 조건: -<br><br>
	o 기능 흐름:<br>
	   1. 사용자는 아이디를 입력합니다.<br>
	   2. 사용자는 비밀번호를 입력합니다.<br>
	   3. 로그인 버튼을 클릭하면 서버에서 사용자 인증을 진행합니다.<br>
	   4. 인증이 성공하면 메인 화면 페이지로 이동합니다.</td>
  </tr>
</table>
<br>

 #### 0-2. 회원가입(추가 예정)
 <table>
  <tr>
    <td align="center" width="50%"><img src="images/img07.png" alt="회원가입" width="195" height="422" /></td>
    <td>o 기능명: 회원가입<br><br>
     	o 개요: 사용자 신청을 위한 회원가입 화면입니다. 아이디, 이름, 계급, 소속부대, 비밀번호, 권한을 등록합니다.<br><br>
	o 엑터명: 탑승자, 수송업무 담당자, 운전자<br><br>
	o 사전 조건: 현역 간부, 군무원, 용사 신분에 해당하여야 함.<br>
	o 사후 조건: -<br><br>
	o 기능 흐름:<br>
	    1. 사용자는 아이디를 입력합니다.<br>
	    2. 사용자는 이름을 입력합니다.<br>
	    3. 사용자는 계급을 입력합니다.<br>
	    4. 사용자는 소속부대를 입력합니다.<br>
	    5. 사용자는 비밀번호를 입력합니다.<br>
	    6. 사용자는 권한을 선택합니다.<br>
	    7. 회원가입 버튼을 눌러 가입을 요청합니다.</td>
  </tr>
</table>
<br>

 ### 1. 실시간 군 이동수단 배차 신청 / 확인
 #### 1-1. 배차 신청 
<table>
  <tr>
    <td align="center" width="50%"><img src="images/img01.png" alt="배차신청" width="195" height="422" /></td>
    <td>o 기능명: 배차 신청<br><br>
     	o 개요: 군 이동수단(차량) 관련 실시간 배차신청 화면입니다. 출발지 목적지를 설정할 수 있으며, 탑승인원 그리고 경유지 등 세부사항을 설정할 수 있습니다. 군 이동수단의 효율적인 이용을 위해 세부 옵션을 같이 신청받아서 유동적으로 활용할 수 있습니다. 행선지가 같거나 시간을 분배해서 차량을 사용할 수 있다면 효율적으로 이용할 수 있습니다.<br><br>
	o 엑터명: 탑승자<br><br>
	o 사전 조건: 회원 가입이 되어있어야 함.<br>
	o 사후 조건: -<br><br>
	o 기능 흐름:<br>
	   1. 사용자는 출발지와 도착지를 설정합니다.<br>
	   2. 탑승인원 탭에서 운전자, 선탑자, 탑승자 인원수를 설정합니다.<br>
	   3. 상세 옵션에서 경유지 여부, 차량 공유 여부를 설정합니다.<br>
	   4. 배차 가능 차량 검색 버튼을 통해 실시간으로 예약/즉시 사용 가능한 차량을 검색합니다.</td>
  </tr>
</table>
<br>

 #### 1-2. 차량 선택 
<table>
  <tr>
    <td align="center" width="50%"><img src="images/img04.png" alt="차량선택" width="195" height="422" /></td>
    <td>o 기능명: 차량 선택<br><br>
     	o 개요: 1-1. 배차 신청 화면에서 설정한 출발지 및 도착지, 탑승인원, 경유지 등에 따라 선택할 수 있는 차량 목록이 리스트 형태로 도시됩니다. 차량의 외관 사진, 차량 번호, 색상 등에 대한 정보를 볼 수 있으며, 선택하기 버튼을 누르면 실시간으로 배차 신청을 할 수 있습니다.<br><br>
	o 엑터명: 탑승자<br><br>
	o 사전 조건: 배차 신청의 기본 정보가 입력되어야 함.<br>
	o 사후 조건: -<br><br>
	o 기능 흐름:<br>
	   1. 사용자는 선택 가능한 군 이동수단 목록을 확인합니다. <br>
	   2. 사용자가 원하는 차량의 정보를 확인한 후 선택하기 버튼을 클릭합니다.<br>
	   3. 1-3. 배차 확인 화면에서 선택한 차량의 배차 진행 현황을 확인할 수 있습니다.</td>
  </tr>
</table>
<br>

 #### 1-3. 배차 확인
<table>
  <tr>
    <td align="center" width="50%"><img src="images/img05.png" alt="배차확인" width="195" height="422" /></td>
    <td>o 기능명: 배차 확인<br><br>
     	o 개요: 배차 확인 화면에서는 탑승자가 신청한 희망 차량에 대한 예약 진행 현황을 확인할 수 있습니다. 상태는 '예약진행중', '예약불가', '예약확정'으로 나뉘며, 탑승자는 배차 취소 및 해당 차량 상세보기를 할 수 있습니다.<br><br>
	o 엑터명: 탑승자<br><br>
	o 사전 조건: 배차 신청 및 차량 선택이 완료되어야함.<br>
	o 사후 조건: -<br><br>
	o 기능 흐름:<br>
	   1. 사용자는 본인이 배차 신청한 내역을 확인할 수 있습니다. <br>
	   2. 신청한 이동수단에 대한 외관 사진, 차량번호, 특이사항 등을 확인할 수 있습니다.<br>
	   3. 사용자는 '취소하기' 버튼을 클릭하여 배차 신청을 취소할 수 있습니다.<br>
	   4. 사용자는 '상세보기' 버튼을 클릭하여 차량 정보를 확인할 수 있습니다.<br></td>
  </tr>
</table>
<br>

 ### 2. 군 이동수단의 one-stop 관리 서비스
 
<table>
  <tr>
    <td align="center" width="50%"><img src="images/img02.png" alt="사고접수" width="195" height="422" /></td>
    <td>o 기능명: 군 이동수단의 입체적인 관리<br><br>
	o 개요: 군 이동수단의 관리 화면입니다. 안전 점검표를 차량 운행 전에 작성하고, 운행계획을 작성할 수 있습니다. 또한 사고접수, 구난차량 요청, 응급환자 후송 요청 등 응급상황에 대처할 수 있는 기능들을 포함하고 있습니다. 또한 차량 이용 완료 후에는 반납까지 one-stop으로 서비스를 받을 수 있습니다.<br><br>
	o 엑터명: 탑승자<br><br>
	o 사전 조건: 배차 신청 및 승인이 완료되어야 함.<br>
	o 사후 조건: -<br><br>
	o 기능 흐름:<br>
	   1. 사용자는 안전점검표 작성을 통해 차량의 안전 운행을 준비합니다.<br>
	   2. 운행 계획에 출발지, 도착지, 이동 경로, 특이사항 등을 기재합니다.<br>
	   3. 차량 사고 발생 시 사고접수, 구난차량 요청, 응급환자 후송 요청 등을 실시합니다.<br>
	   4. 차량 이용 완료 후 차량 반납 탭을 클릭해 차량 이용을 종료합니다.</td>
  </tr>
</table>

 ### 3. 운전병 마일리지 전산화

[(Back to top)](#목차)

## App 구성 및 필수 조건 안내
* 크로스 플랫폼: iOS, Android 사용 가능
* 권장: 

[(Back to top)](#목차)

## 기술 스택
### 📲 Front-end

| Name     | Badge                                                                                                           | Version        | Website               |
| -------- | --------------------------------------------------------------------------------------------------------------- | -------------  | --------------------- |
| Dart     | ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)          | undefined      | https://dart.dev/     |
| Flutter  | ![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white) | undefined      | https://flutter.dev/  |

### 🖥️ Back-end

| Name       | Badge                                                                                                          | Version    | Website                  |
| ---------- | -------------------------------------------------------------------------------------------------------------- | ---------- | ------------------------ |
| Python     | ![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)         | undefined  | https://www.python.org/  |
| DjangoREST | ![DjangoREST](https://img.shields.io/badge/DJANGO-REST-ff1709?style=for-the-badge&logo=django&logoColor=white&color=ff1709&labelColor=gray) | undefined | https://www.django-rest-framework.org/ |
 
### 💾 Databases

| Name     | Badge                                                                                                     | Version           | Website               |
| -------- | --------------------------------------------------------------------------------------------------------- | ----------------- | --------------------- |
| MariaDB  | ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)  | undefined         | https://mariadb.org/  |

[(Back to top)](#목차)

## 설치 안내
```bash
$ git clone git주소
$ yarn or npm install
$ yarn start or npm run start
```

[(Back to top)](#목차)

## 프로젝트 관리 및 개발 문서
 - [Figma 프로젝트 화면설계서 링크](https://www.figma.com/file/UTHVGHLnpkpmhcldx03Cjj/Military-Mobility-Platform?node-id=0%3A1)
 - [Database 설계 Diagram 링크](https://viewer.diagrams.net/?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=mmp_db.drawio#R7Z1bd5u4Fsc%2FDWv1PCQLsMHwCHYybSdpZ9K0086LFzEkYWobF3CT9NMfiZsB7bjC5makWV3nGEywLf2lH9raF2E0XT3%2F4Vubx2vPdpaCLNrPwmgmyPJYk2UB%2FxPtl%2FiMpKnJmQfftZNzuxOf3F9OclJMzm5d2wkKF4aetwzdTfHkwluvnUVYOGf5vvdUvOzeWxY%2FdWM9OMSJTwtrSZ79x7XDx%2Fispoi7828d9%2BEx%2FWRJTN5ZWenFyYng0bK9p9yp0YUwmvqeF8avVs9TZ4lbL22X%2BO8uX3k3%2B2K%2Bsw5p%2FmD57l%2Fv7OKt9eNiu7n9dvbz1v71%2Fiy5y09ruU1%2BsDCVBSP9yuFL2g7Bk7taWmt0ZJIfnN7F8UPnOXcq%2BSJ%2FON7KCf0XdEny7pk2Sj4i0cXZeKzEJ552rSyLk%2BSqx3wTj7XkUivp24fs%2Frufj14kLQC3xrvgn%2Bft37%2FuZFO2bHP6JL87OzubEK3xOXB8si0erQ1%2BGVp3%2BJQZhJYfJtJFv2tkIjGGlrtGfzqaSdHxcmltAje6PD7z6C7tK%2BvF24bpjdIj8959duybWLn4WiTiK3QzfIhvfo9u%2Fin5Mvhta%2Bk%2BrNHrBeoO%2FImm7wTou1xZQZjdYLu2HTv5e7L79iqDuk91SSl0qQT16Bjo0FE61mvvT41U996%2BvMHj03z0fPcX7sFl0mL5%2Fo2Ok7Hw1rHs0inTi2a6qJ%2Fc5XLqLT0sgrUXjZyiDvBFtu9tbi3%2FwQmTExvPXYdROygm%2BodaZiqeK4KCvusUHUu7Y%2FQPX%2B6HU28dhD7SG76Hg7r9ycFdb4beJrnp0rlP7%2B8n7Y5f33lh6K0oRbJ3wPxeJIko0mH%2FW000JQmdkMRff74qCvT7Q9da3iCwWOuHZdyFEWesXRcC%2FQy2fNba5W4oD2gPNef9MkLFo2vbzvrQ3tGoeyfXHaOKvZHcbNdGle9mLdG8tbZCNHjQjwyILs6%2B5%2BG9ns4wpZl9%2Fg69Et8Yn28%2Fzt99mN5cXF98uP1fx3JI5%2FP4WjPYWAt3%2FXAV%2F6Va0ovSjV6eXx%2FNUq36obpdGwICHpQ4SgCUiK2hRO0aJZJMr4l2pg7HdtP71QoSif5hcPAkGRGdvrZWTrpqEt8IF1NBnwnmWLgwBUMVtHHvgdKFTtgjyJgTpGcE0TsniMIMQcbUnTN4gqhEpz84qEX9IkO0sYAGGGKIOWKLIfRKYY8hpIGSM6Rbhkhy5xCpYOU8cYjQ987gIULaMX1r%2FT2PECMmR%2FRCEzSdIYTQ64Q5hKTTFUdIfxCidI0QuYJ187QRksmfIyTt41yn2w7u3RVuwuJaRBW0afpixg5IKqhlyCD576315Z8f779%2Bk%2F6%2BW21uZ7P5yxTyHOEc6ZYjWoscATUxxA2RveJniiJgS5DbISEeITl8zARNSfFhCMY4OoPXJIPkyJFyGTJGjO3sm249P12NvLHnfd2Ik8s7jpHeYSRTRhsYATUxRIzsFT9TGAFbgsTIf9%2BfPH9pLx6t1cb11kNkxZGaGDIr4OUYqRIOi45hMW4RFrAoKvhVnAwt9sufKVzATdE7x4kWjVL0MmCPEKRvBSdEx4SYdE6ICl4TJ04Ilbp3Bk%2BI3nlFtEgIehkMmRBX6%2Bm1%2FuN2%2B%2BNv6%2Frtl3%2BV1WjxJ2Bvmlr%2BfkaUeNDHCE9SGPXEdCqjYkynogIxnYoC9GwdMZ1gB1YwDjFNeFgWe8fEUVGcoAqaEgFpCDiJKE7K%2FpCp%2B2NAFAdbglzbo9k6idqMfKNVQRPxC22avDBlQdPwFpOuYbc3vINv4v%2B9mApo4Bkavka%2FFDQ9Olm%2BvvdbUjSxn7WrbM9Dglxx1P%2FmIYHmdi3IroJ1gWnGwM%2Bk9TAGCu9slTEVTAm9WTVSdoZC3RlDBwxpGlhvV3flWJwSOerEhtTZ0nLl%2Fcx9h2hJkT%2F2Qiv%2FHW1n6eSPS2KsXXjMMYfnqumeOVBAaKvMIaM6BsMcJpPRwLIkQzBWUeK8vcyJonjMaCFjIPgonDm1C2%2FIzIENxRXmGw6dhqADRpA2RR1QBiNyQjpF7OyXOFPcgbuZ3PtAi525dz%2FfWEHgrB8cPyg5bo8EXUoct83YYmZgBiU2N0MwlMS2hjPeaNELBCyRs6l%2BdQ4ZTvBEyl3DewAnKDa11SXRSWZZo%2B0OJh3A4aYgt%2FQ2aHRtl4Hrrefhy6aUYs1UBX0cLYYmUZKDyBKnKxGsEIJm%2F3stjzXzIDpWieyBiGdu6wGIoODWdkHUO5%2FjGkHEZHo2uCnIfb9F1EnFjAijyCgXv5D4eqd%2BnbGHGZ7crXvMgMGv7WKmd47LNWKGyQRucFOQpvelt7BCHOpazCUdpQLFKx4dLXE4aeqX2pBJA1od%2BXqmB6CBAmdb3fUZxnJmr8CZwgzYEuRiZu049nzpLpx14BR3e3QlIY1uYNta7B9t6FEpA%2FTuRNA4fupX4JDpI5vSw%2Fu38tmTJn0UF7fm9Y%2F7yzN5XMGiz%2FnTFH%2BgsNym%2BPOKDiqk8%2BgxgX4jcqYY9EpbkA%2BcC2s99127tKmjaXgXJ84zakiAswH3NKAA0tGCHDKSplf%2F%2FnWlLvUvN1e3M%2FevH4%2Ffz2zI1WDmuz956VdKpUiyThEnDCV9yKojH4MXuE%2F5UwbdUwaNTPaPml5Wf4W%2F8okGDh%2FWP0w%2BgsBNQT6BxBM8uxVgj5XMkDOHwG3Do4Lpl60tAaXNGrDwVz7FKOHDOofJoGG4KYCoYRZrwB6rE%2BYQUqXODkdIOwhpswgsLIoKC9XTRohM3zlDRwiQyprJ%2Bn3H6oQ9hHDnjd4hpNUasLAqTtGZ47C5gUnfDrgpyLUnwwX8jlXLkEkC7%2FLwxUj%2FSNJmKVhYFUNcjezXP1MkgZuCXI1cu0vHeijbtIzUGVDdZVDFAbhaavGaJhYvY5rG5h7jotFf2hyrqCHTBq7JzmHTO9i0WS8WTn8yQNbsVT9TqIGTEBFdDvii1%2Bh23l%2BEHCmUIRMEXsuRu25v3SD0knloGF56%2BKhW91DS55X2YaaqEvVyrRAF8AEUIR9ApQa%2BwJLhSXUbfuqQK9cDgyYsSBXN2UrJyFvsAzi9%2FFPqGDONeQLKByXfVWvFCM3dWqAIkOvyc5D4Afb7GaMxp78K6ngu9mWue6WqC4f9aqG6XRty4etWOoIc7EVenSCQ01%2BrBBmR69aEIF2vXxsjyOigFewwCUIuYdOiVIwCpII42AMI99fo3RIEcvlrFyDMuGuMDnLXGCY36N01cHLbaCcNjT194Dtpx8qGPaLwPIG9IwroAdguUk4xbeBhc8NBSQSHiRTSlGn5vosOi7tp2mWaQ1DEO2sM8qRyNkB2eFIlDQ%2FnSUs8gfwAW%2BUJkLNnoDzJ9M95MibXpTb6wNCFglunaa2NKTscqaAV9jhSIRSec6QljkAufu1ypMJq9cQ5olL3zuA5Qi5GSYZkMUlxutkUJmnWP4ZSJlRQDntU4SVqe0cVsEhGq1RJl0cMUOWg%2BrWDpIpC%2BuL46Ns6paQJUlQlPYlCYggilUvJMgQRiunCsR%2Bc1DsCtbQbvtw4y6gey8XundiHIqaIJGPOhKtlMuSdtW34ftSTFze%2FHN%2B79a6t9UvKnt17K2ttf4y0VOxo9Kn%2By9f8wTd8cK6kh7Pn%2FJuzl%2BzITr9SmXTRCefZDb%2BmXxK9zt0VHe1uig9eXhXdPifxwNv6i6QdwfTkSXOHKSVf66jUkwR3Bu1cJ0HkyU76USf%2BzN9tr5L%2FwuzejZHJpOjUrqaJbtNbxD89%2BaudcokbaaUbKeUbxW1D3Ki2ISC3PQTQdPnaCCiMjuIgINVbVPfhwtzr%2B9obwUlSKZXyRBIPUxyRlFkt36k%2ByYF9ACguXtvFvg2aIuhR7XjEbg21UwxtQzC06N04zXscXozffYMekRfOJtxa%2BINnVmih%2F7v2bGeJgApgPnmYByVT2V8NPSSnlpSkMc9GwJavNBElQBpSHUmuwSYmt27SvOVgwDY%2BcwFmzS8OwqdHN3Q%2BoWcV%2FO6Tb22Kw5xyDMpVW1kdF9tYARy1srbMt7DaVPuSJs0vzqO7iJ5zopo5uPynFmkXtbSMDnvatLrSt6bdE833arKBKBNa8nQvRUW%2Be9nYmlhs7FHnjQ1kDcNRL1lTT%2FBsjFt1miQt1czci95PHGO5dw1O7qTlGxz7YUR00y9TbWcZYyPlG71v87LIoa2Gltsc2ICKfSjN9DkDPRHFhc50LRG3MSab99Fb3W2D3zdt7klYb7KlR%2BW5mwysVYCGriOsFv4FFHs6uaVAYjjJNVxRwKVmPHgZ3NwyN%2F15udXEvsex%2FDJ3r1KrrDr29fCRaw5lUhJYeYjSLjnU0jystLzioInWG6Iwe6IjrbRGUiX9XFX03X%2BHqar87Pqb276iMdTp1kvusmST5tUfo8vAp6pi9p9UEnB8%2F3rlDHjmJU8FUrRfOsbW7tMDmlqyhY2BWoStAo0mSKuOeWM3VXxL5wOKeWM3V3zLTxV9Alqq1J5MRBO9xCHxQKBpJYvEuCzBpoFGESh2hDAPENihEKxbmLTKnHBhHkPBSWmVl660m%2BUetJAbAPf0Uu93z72WFnJ9415PZgNJlMbnql6cEXTxXMz9Jx82P4C3lvfeummUUQSodYQyqVuUqaeJMqk0mWm1CFcTtfM09iRjjnqu0Im1Kt7QMCktRdrgG%2BSOMgS%2BaaUMgFCihVb5Nm7JHlSNbyfJKk0tDvdsi6XyAFf0c3VUtqNktx23u8BSKNyLuUJoFXIuqTurnAbPBYfopXSrljWiktP19NFZfL9yA%2Fw936R7S5kTgBjN3RIYGVdp766leXtSdjkCcnQ2tpUnm9LD%2B7fy2ZMmfRQXt%2Bb1j%2FvLMwmIRLxxAsf%2FGbmjEa16agl%2FyZ6s7pI0Ki%2FNgZjhEeSqNq7o0Jv5QJVdoIAd3%2FZdxV%2FRDw9GpAsbgdX4m0F5TLJfWJLNTSSkiQPnanxFCv3J0kjdJwdFHULFAPb1ATArVLxbK4OeNDHkoDF37TfG59uP83cfpjcX1xcfbnsfHEKTsbEBoewpLTCpVThUt2tFOTzKkD7KsDlcAPZwEBd1xBXC3%2FkkAwupO%2BSgWMJTL0PzSkeTpqE7z%2Fue84nV0rJmimCit8UkQt2IXqBlnjHb46JJrRGpFZBAqqm1zEgDEqxIoSMK3NDcrhVNyoQmOYXap1AWytUhhirkZDs5DGUy5xiSFNLzbGH5pWzAxWAB7NIuR2yaYUiZx1RHY4w%2BFZTHIH0qJCXn9GmOPrQ2swbpU8F4enr0oe%2BR4dOHNI7acfwwVPY5jtQe51Y9yVWcPnUrj0H68FKNvaAPkBSobfpUsMWeHn0OqsQ4TPoAfhVxQZSt7zRdD4U19FQu8cgQelRe47EX6AG8RVtGj1rBAHty6FHpXYyGjx7Svmqj0eCuY%2FeyhounMAafCsJjED68PmQf4CMD2dzahs8pFoWkngMOqgM5UPiQ5tV7NOi8J8cP5uvtilz7jNOk%2BPhs5IegRYFBURJ9Q0qTR8XuCiZ3SGhGmAzCiZea7AWcaD37G4TTKZaXpJ4DDqooOVA4kdbXAHWMlyWVjUKczNj3bZp4w%2FEFUTXmVK5GyRBz0u%2FBmdMtc4DgrpaZM6lglz055mQy58yRJqTZ1Q3mqGt9NIGXqrsU2ZMkzp3gxMV4e0jlHGpGgwxyiJdF7gOHRkCtsbY5dIqlkKnngIOqHw%2BUQ6QF1s%2FFj%2BJSyCXHOChGKKuNzEODqtGocm1llmjE8xn0gkbj7ml0igWVqeeA2rIZDIBGpMkVrYqszcZHLWyXaikbaZWWaBuIL4uOAlFjmRKGACKeKaEXIOo%2BVUJqIBwmiHiqhF1HA3WX0ZAo%2BskhBskRbhLTHMdNA1JjDzcaaRrmuGkfN%2BPuUyJoQ06JkMmc40bSgJQIiDehY8%2BtsIScEV7wZBmzsxw9OEYodpgbcw41oEEGOcSTIxzDoQMKbpeSzSrdp0XQhpwWQeNpEXZtwd1eOx7s3Ueha0N2eNW4w%2BuuLUiD5gcvdO%2FdBU81n9YtK47OMe3ozIb1gBPNp23DWVFjonmN3iTWm0TzOmklHVSi%2BUzoPNG8pJNWSbaTy1cQB3vJ5XXuSVq%2FDbs6IrrfMdWH7Eiqc0fSXVuQ1sJt4PjzwFnbuQzziqBF%2FjmGij1GE%2Bt1GtCdpZrnbqSVnh0r6JA9M7bO3Uj7gKIeZJjXh%2BxGqnM30l1bkIbMOytEQxmHNPjOwink%2B41fvCnmGIlJFGdfNKOUWAbOSSJHJxHCtN0LzqkGNMogp7iXaS841fmmq5x%2B2jA5xb1Mdx1N2k83jr9ygyDahdm3ZCqCSo7rMKvRlTP8J7gOM09VXwlO3Cd1j1JJ6y%2BHUwdw6txJQBYH7JO6kzmHkyySltuVEwTWg7OHTCYOiYgLp%2BiGYOh8bdSA9BjED3dF7QV%2BOk9XL4sDdkjdyZzjRxZJYy0aveE2EJIc9YYeJQnOgh%2BSlIzpAmkkaBJeC%2BF4iSnHUAMSZBBDvGBXHzDUfeJ6WRxwwa6dzDmG5DQVG5wfK2URGlamuKtbnOQigTJlGSI%2BxH8yQuskzqUGNMkelyRezasXXOo8Z70sVbDTnhyXMplzLskSaYYNXzbO3LufrwuhPHs2kQxZ0CIWGQqCFWdRAzpkkEXDcPg9JKAzWTonNFBBGgxyLuLW2WMeP2qQWvcLYmnIdlmJBbssOvQ9L8xf7lubx2sPUROd%2FD8%3D)
 - [backend swagger 링크](http://34.105.35.232:8000/swagger)

[(Back to top)](#목차)

## 팀 정보
<table width="800">
<thead>
<tr>
<th width="100" align="center">이름</th>
<th width="250" align="center">역할</th>
<th width="150" align="center">Github 계정</th>
<th width="300" align="center">E-mail</th>
</tr> 
</thead>

<tbody>
<tr>
<td width="100" align="center">박유진</td>
<td width="250" align="center">팀장(PM), UI/UX 디자인</td>
<td width="150" align="center">	
	<a href="https://github.com/LatteHorse" target="_blank"><img src="https://img.shields.io/badge/LatteHorse-655ced?style=social&logo=github"/></a>
</td>
<td width="300" align="center">
	<a href="mailto:eugene5802@gmail.com">eugene5802@gmail.com</a>
</td>
</tr>
	
<tr>
<td width="100" align="center">박철완</td>
<td width="250" align="center">프론트엔드(Front-end) 개발</td>
<td width="150" align="center">	
	<a href="https://github.com/CodingVillain" target="_blank"><img src="https://img.shields.io/badge/CodingVillain-655ced?style=social&logo=github"/></a>
</td>
<td width="300" align="center">
	<a href="mailto:cheolwan.park552@gmail.com">cheolwan.park552@gmail.com</a>
</td>
</tr>

<tr>
<td width="100" align="center">이승효</td>
<td width="250" align="center">프론트엔드(Front-end) 개발</td>
<td width="150" align="center">	
	<a href="https://github.com/AstroHyo" target="_blank"><img src="https://img.shields.io/badge/AstroHyo-655ced?style=social&logo=github"/></a>
</td>
<td width="300" align="center">
	<a href="mailto:spinelee2002@gmail.com">spinelee2002@gmail.com</a>
</td>
</tr>
	
<tr>
<td width="100" align="center">박세환</td>
<td width="250" align="center">백엔드(Back-end) 개발</td>
<td width="150" align="center">	
	<a href="https://github.com/sehwan505" target="_blank"><img src="https://img.shields.io/badge/sehwan505-655ced?style=social&logo=github"/></a>
</td>
<td width="300" align="center">
	<a href="mailto:sehwan505@gmail.com">sehwan505@gmail.com</a>
</td>
</tr>

<tr>
<td width="100" align="center">박주환</td>
<td width="250" align="center">백엔드(Back-end) 개발</td>
<td width="150" align="center">	
	<a href="https://github.com/Jkworldchampion" target="_blank"><img src="https://img.shields.io/badge/Jkworldchampion-655ced?style=social&logo=github"/></a>
</td>
<td width="300" align="center">
	<a href="mailto:standardjuhwan@gmail.com">standardjuhwan@gmail.com</a>
</td>
</tr>
</tbody>
</table>

[(Back to top)](#목차)

## 저작권 및 사용권 정보
 * [MIT](https://github.com/osamhack2022/APP_Military-Mobility-Platform_TeamName/blob/main/LICENSE)

This project is licensed under the terms of the MIT license.

※ [라이선스 비교표(클릭)](https://olis.or.kr/license/compareGuide.do)

※ [Github 내 라이선스 키워드(클릭)](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/licensing-a-repository)

※ [\[참조\] Github license의 종류와 나에게 맞는 라이선스 선택하기(클릭)](https://flyingsquirrel.medium.com/github-license%EC%9D%98-%EC%A2%85%EB%A5%98%EC%99%80-%EB%82%98%EC%97%90%EA%B2%8C-%EB%A7%9E%EB%8A%94-%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4-%EC%84%A0%ED%83%9D%ED%95%98%EA%B8%B0-ae29925e8ff4)

[(Back to top)](#목차)
