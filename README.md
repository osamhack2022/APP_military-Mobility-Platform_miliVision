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
- 스마트폰 app을 통해 군 이동수단(차량)에 대한 정보를 실시간으로 공유하고 관리할 수 있는 플랫폼 제작

[(Back to top)](#목차)

## 기능 설명

 ### 0. 로그인
 
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

 ### 1. 실시간 군 이동수단 배차 신청/승인
 #### 1-1. 배차 신청 
<table>
  <tr>
    <td align="center" width="50%"><img src="images/img01.png" alt="배차신청" width="195" height="422" /></td>
    <td>o 기능명: 실시간 배차신청<br><br>
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
    <td align="center" width="50%"><img src="images/img01.png" alt="배차신청" width="195" height="422" /></td>
    <td>o 기능명: 실시간 배차신청<br><br>
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

 ### 2. 군 이동수단의 입체적인 관리
 
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
 
 - 운전병 마일리지 전산화
 
 - 사용자, 운행자, 수송업무담당자들의 커뮤니티 형성
 
 - 사용자(탑승자)들의 군 이동수단 이용현황 분석(통계)

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
 - [Database 설계 Diagram 링크](https://viewer.diagrams.net/?tags=%7B%7D&edit=_blank&layers=1&nav=1&title=mmp_db.drawio#R7Z1dc5s4FIZ%2FDTPdi2T4Nlza2N126%2Bx202x325uOahSbKQYX4ybur18JBAYkU0FsjIFMpgVBZHzOix6OdCQExVo%2F%2Fx6AzerOt6EryKL9LChTQZZVQ5YF%2FCva%2B7hEMkUpLlkGjk3KDgUfnJ%2BQFIqkdOfYcJs7MfR9N3Q2%2BcKF73lwEebKQBD4T%2FnTHn03%2F6kbsIRUwYcFcOnSfx07XMWlhiYeyt9AZ7lKPlkSyZE1SE4mBdsVsP2nTJEyExQr8P0w3lo%2FW9DF1kvsEv%2Fd6yNH0wsLoBfy%2FMHcs%2B7M7w%2B773%2BDuzcfP2trZfHuhtTyA7g78oUtEJDrDfeJEdClb%2FBmCL7iosk2BEFIfKWIqABZPwSOBwNUIEX7rgs2Wyc6PS5ZOa49B3t%2FFyYVJXuTR%2BcZ2vexq%2FC5yGtzVBnexZU%2Foso%2FkIvBh4HrLD20vUBfHH%2FiJIBbdC1zsA3JGbRpku8JgxA%2BZ4qIqX6H%2FhqGwR6dQo7eyAbxG1HuTbL%2FdJCBrJKyVUYCqcMBkd4yrfzgHbRBHFTBWTLlrHJP3WO5TVZ%2B4PzE%2FnGJPbPei%2FafnLULPKRjYBeKJn5040ZecFzX8l0fu9jzPUh5GZ9kB%2F7mAQRLGJKCje94YWQHbYJ%2BkWUs8VYTNHStFtqXDvvoF58ehJbvbcMAqQnXAZFTnyB27CT0N6RSFz4m9QfE7nj7qx%2BG%2FvqoBEr1%2F2tdEBkonCpQziUChRLB%2B3dHZYC%2Bf%2BgA9x61jMBburHTooYSHJzG8CzT1ql9i4Yv3qA%2BMuejG7V1K8e2ocfvD5nbHxkHKBXtTyo7WKVybcBFLY8HQnSD7Dx7Szk1vc76flZZLfOXt2hDfDXehT76%2F%2B2f1v3sbvbnw28XFkDSIsfnTrYbsHC85Tz%2BS72gEK0phTwfv2OlkyqGq7oGJKMNfODig3hGPuiX5oPOL4JmGgdoO0l9L4SDxu2MrsNhRDnZ262%2FoodhSxbGIkaEMLMEdDuNDWE2EczXgmHijYksGKhkKpiGMDFegA2pEWywtLL2f2SuIXr0z%2B77IcheI4pHYXa%2FIMaTC693zDEG5lycOealmWN2lzkGtzO6zpykwcl4eR3195UyZ4w4gwvRoTGCjzYw5%2BTC6x1zJLrXcoBO09CR5EtTR6rQH3pt2JH4%2FdF57tA9nht0d%2B3creN7X8I98m%2BeQLpgqhFvRoKhkmDH1HCJgbA0%2FS05feDQiZXYPxDRnbQDiBoHkXZxEFXoeL06EKnc%2Fug8iOiu1UXkpBx%2BDCWKe%2BINaQh3Tq%2Bz%2FmGG7u4dMNM4ZnjzP86HmQp9rVeHmRG3PzqPGbo31fUXIETRTp40phXFNyjiMVGIM5Dm9FLrMmms%2Bef3c901P97PH6bO%2B%2B%2Brbzc2q2ftny0MymkjtD8hMMAWgwnkaKFUjnHVi2YHsn1XoTus108JPIIovztamS3IvuQrTRes5x%2BZ2z8deohgm4LumcINeZI%2F%2BM%2FDX1%2B6lT14bsH071FgyCbkDzobwkmTyYXsS77G7MJ6zullsiHbFIxsQ7AujLqZU2Gi4ryPsY6i0tYj5RI66R9ChuTA1iGkyVxB9iVfY7JgPef0MneQaYqk0yPj9CVEFi2OnakCusNwnrrSL4gMyX7HpTMk%2B7UOIo3m%2FrFVUaGz87opUqFvuvMUoTszA%2BB9yzJkHKOD5J0bZn8YUn0Mo0cMGfL02seQJtP22Kq4xrS9em1DL5P42KagezBtiL27xibMRyO6YFjJxrRHJBlS8XBt7tvP%2Fs3sDfg%2B220ePt38eLB%2F%2FjFMPWojSZrMzGOroovRSLn%2Be0UStinoaOTOcSFeTy4%2FMjKORkamgqnjzHAUOuNRklG0EEM8bmKRcZOxlUxbEjtJm5cqqsu0YZOYHnl742xDnzRZ3cjIw3snzQOlk1tpKVYWXdrllST8sQZSRIZsZO1s8cswvHbmZxGZP1W4JOGPpYrzBbX08BpO%2BLNev5MujJSzpf3JtcbZ9JMSg6e2BoCRfCQr7a%2FdzxNny%2FGroI7nvC8z7pWqhhPlauGqrgm5DNEsH0Fqp4xXJwgrx69Rgih0MEsIcumg9mwEUWpFtd0kCB3VJuvO9hQgFcTRP4AMA2utC0F4A9PzAaQ342pKrXG1bnKDf1wNL9AUdXmie8%2FseJfnS2XTP6IMa120jijMdL9mkXKNS1%2FUaxtqLYTRTaTQXZkgCBy0m%2BXJRDBeJ%2BtgiMLY7CNPKq9o0R%2BeqHQ8O%2FDk0jxhpf41yhO1Qtx63TxJ9T%2FwRKXjUht9YOiw5rJayXqxVn84UkEr%2FeNIhZnvA0ca4ggr8a9ZjlSIVq%2BcIzq3dzrPEToYpRmSJo%2BbY7IceQSTaGKS2KvJrRWU0z%2BqVJgMP1ClGaqkyZ8Xo0oSHvWAKia3d7pOFY3OxQnQ1cLC7FYpepkSSRfvEUT4hdI%2FiHA0F9BewiQ7AlnaCff30I3WFJ4djsQ5FDFFJBlzJly75JaHnj0OgsiTs%2FufMPAf%2FDvg7RP2HI6tgWf%2FFWkp72j0qcH%2Bv%2BzOJ7xzqyW70%2Bfswek%2B3bOTSyqSLiqAz074X3KRaDtTK9o7VIp39kdFlyTH%2BrtgQUxW9vbhMAHiMZ8kSSPY7rzNmsSCTFoYRP76AXPXWyLa9xjTh9shVQmhXDErPf7m5I8OGqXq0fPV3BTriS1D1XMyrctNax21i8eknrsN8mqnZZqXMZcCS%2FNZW6MspbAUsq7VUxa1pLKinUta7IlItLLw4JJGzc9C4Rs6N6bwmLzt0Jji9SbIxC589NXcXzoLgD91CkKA%2FrvDL0tEeGRAmzyal%2BmCH3w3hlY0JHP8dsTShHSK5amZ5mXcuHEsHOeCIDubYgXzopBiATfh7iIWlkeUVhkmlkai1KiJ6aGuePF25jxEXDJDNqeNlW%2FJnlZOCD%2BgJzt89CkAm3xbSZuz1Pv8j29FXjHS2lJLZu2rn8u6dAfwR7hyFtFT4StsV%2FzCHyNS7jh60bbSUtOaWttMWzLN8egc2vTFsqhRkKLX%2BrXS2IaYN7ZycWMzFsPJNRMj3BZjq1pkRVdjktlofcOhyq0zOD3umDV44Y3JsphZTjdS%2Frj1Ni%2BKnDUw07DNGcN1ccbpJHnKwK8EneJ%2FTYOIe6zS5l3566%2B77a9NmwknzHNaWim23RplaY1h6FNMQmZ%2FA44RsEw8RbqZMobLC7hgxtqdBifpFChzWTZOK3sYy%2FYUlCq1SjxX5uEXRnPaqCCw4i3K3VFQaIc1qVDRmcM5nrmNXRRmS3RkFHsFJPNW18zDTz1VFZ9df1HtEY0hp4N95jQypHX0y5gy41N1Mf2RCgKO6z%2BtnBl5jOSpQMosnXx1QNNHWs606oh%2BdGgUaDxT2k7Rbhyaik9Je8DRbhzaik%2FZpqJNQEuU2pKGaGQWOCTWBJpR6JFQz9f1zbYrx7S6FwizhsDqQvDUwuRV5mgQ5ksoOCpEeUmkfV7usQK5DnDPLHj%2F8txrKJBrG%2Fda0hpIoqTe6ma%2BRTDFWzHzI9drH5hVy6VVnxtlHNP5LoQy6bIo068TZVKhMTNOIlxDNG6TmTopc%2FRbjU%2BsVfGGbpNCKNIE31jJO13gm6HkjclalqJRvqkN9QdV49tVssooJAGlQyyVb3DNvNWVYj9KWq3abIClcSRjDwrhVcitpB965Qx2W1BHL4WqGtaITjfX1gouvs2dLb7OV8nYUpoEIEZtt8ScR1hp7K6hdntk5tvtEWNF01MN5aHdwPfDrIfQ115FaTyo8H8%3D)
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
