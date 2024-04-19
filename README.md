# 국내 관광지 소개 웹페이지, 나들이

-----------------

<p align="center">
    <img src = "./forREADME/MainPage.png", width="100%">
    <sup><a href="http:/223.130.130.226:8090/" target="_blank">Nadeuli 메인페이지</a></sup>
</p>

-----------------

## 목차
1. [개요](#개요)
2. [개발자소개](#개발자소개)
2. [설계의 주안점](#설계의-주안점)
3. [주요기능](#주요기능)
4. [개발환경](#개발환경)
5. [개발기간 및 스케줄](#개발기간-및-스케줄)
4. [문서](#문서)
-----------------

## 개요

- **나들이**는 국내 관광지를 소개하고, 사용자들이 관광지를 탐색하고 리뷰를 작성할 수 있는 웹페이지입니다.

-----------------

## 개발자소개
<table>
    <tr>
        <th align="center" style="color: whitesmoke">이름</th>
        <th align="center" style="color: whitesmoke">이예지</th>
        <th align="center" style="color: whitesmoke">이훈민</th>
        <th align="center" style="color: whitesmoke">정용철</th>
        <th align="center" style="color: whitesmoke">최인환</th>
        <th align="center" style="color: whitesmoke">김재원</th>
    </tr>
    <tr>
        <th align="center" style="color: whitesmoke">사진</th>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/65521821?s=60&v=4" width="100px"/> </td>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/152182670?s=60&v=4" width="100px" /></td>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/156390277?s=60&v=4" width="100px"/></td>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/156388758?v=4&size=32" width="100px"/></td>
        <td align="center"><img src="https://avatars.githubusercontent.com/u/130049758?v=4" width="100px"/></td>
    </tr>
    <tr>
        <th align="center" style="color: whitesmoke">역할</th>
        <td align="center"><strong style="color: white">프론트엔드</strong>
                                <br>
                                <br><strong style="color: white">백엔드</strong>
                                <br>
        </td>
        <td align="center"><strong style="color: white">프론트</strong>
                                <br>
                                <br>백
                                <br>
        </td>
        <td align="center"><strong style="color: white">프론트</strong>
                                <br>
                                <br><strong style="color: white">백엔드</strong>
                                <br>
        </td>
        <td align="center"><strong style="color: white">프론트</strong>
                                <br>
                                <br><strong style="color: white">백엔드</strong>
                                <br>
        </td>
        <td align="center"><strong style="color: white">프론트</strong>
                                <br>맵페이지 지도 구현<br>메인페이지 디자인
                                <br><strong style="color: white">백엔드</strong>
                                <br>지도 페이지
                                <br>메인페이지(추천여행지)
        </td>
    </tr>
    <tr>
        <th align="center" style="color: whitesmoke">프로필</th>
        <td align="center"><a href="https://github.com/leeyehji" >깃허브</a></td>
        <td align="center"><a href="https://github.com/cuscus8">깃허브</a></td>
        <td align="center"><a href="https://github.com/jyc961020">깃허브</a></td>
        <td align="center"><a href="https://github.com/Choiinhwan11">깃허브</a></td>
        <td align="center"><a href="https://github.com/UsoD98">깃허브</a></td>
    </tr>
</table>

-----------------

## 설계의 주안점

- 정보 제공 사이트에 맞춰 다양한 여행 정보와 기능을 제공하기 위해 노력했습니다.
1. 지도 이미지를 통한 관광지 탐색 기능 
2. 테마 태그를 이용한 관광지 탐색 기능 
3. 사용자 편의성과 심미성을 갖춘 리뷰 작성 기능 
4. 사용자 전용 캘린더 기능

-----------------

## 주요기능


- 지도 이미지를 통한 관광지 탐색 기능

- 테마 태그를 이용한 관광지 탐색 기능

- 사용자 편의성과 심미성을 갖춘 리뷰 작성 기능

- 사용자 전용 캘린더 기능

```angular2html
사진,그림 등을 통해 기능을 설명할 예정
```
-----------------

## 개발 환경

### 프론트엔드
- HTML
- CSS
- JavaScript
- jQuery
### 백엔드
- Java 17, Servlet, Spring 5 , MyBatis
### 라이브러리
- Lombok, JSTL, JSP, Leaflet
### 데이터베이스
- MySQL, NCP Cloud DB for MySQL
### 운영체제
- Windows, macOS, NCP - Ubuntu 20.04
### 서버
- Apache Tomcat 9
### 빌드 / 배포 및 CI / CD
- Naver Cloud Platform, Maven, Git , Docker , Jenkins
### 개발 도구
- Eclipse, STS, IntelliJ, MySQL Workbench
### API
- Naver Map API, Naver Login API, Naver Calendar API, Google Email API, Tour API (한국관광공사)
### 커뮤니케이션 도구
- Notion, GitHub, KakaoTalk, Discord
### 기타
- NCP Cloud Storage

-----------------


## 개발기간 및 스케줄

- 2024.03.29 ~ 2024.04.21

```
<여기에 개발 일정 사진 넣을 예정>
```

-----------------

## 문서

**1.디렉토리구조**

스프링 디렉토리 구조는 크게 계층형과 도메인 구조로 나눌 수 있다. 

계층형은 프로젝트의 이해도가 낮아도 전체적인 구조를 빠르게 파악할 수 있다는 장점이 있다. 
하지만 한 디렉토리 내에 너무 많은 클래스가 들어가 세부적인 구조를 파악하기는 불편하다.

따라서 해당 프로젝트는 **도메인 구조**를 활용한다. 프로젝트에 대한 이해가 있다면 계층형보다 빠르고 쉽게 구조를 파악할 수 있다. 구체적인 구조는 다음과 같다. 
<p align="center">
    <img src="./forREADME/DDD.png">
    <sup style="color:#0AC5A8; font-weight: bolder;">- 도메인 구조 -</sup>
</p>

### DB 구조
사용한 데이터베이스는 MySQL 데이터 베이스다. 네이버 클라우드 플랫폼을 이용하여 MySQL 데이터 베이스를 만들어 유저 정보, 관광지 정보 등을 저장하였다.

데이터 베이스는 엑셀 및 DB diagram을 만들어 각 테이블의 구조를 직관적으로 볼 수 있도록 하였다.

완성된 DB diagram은 다음과 같다.
![DB diagram](주소)

**2.FLOWCHART**
```angular2html
<여기에 flowchart 사진 넣을 예정>
```
<p align="center">
    <img src="">
    <sup style="color:#0AC5A8; font-weight: bolder;">- FLOWCHART -</sup>
</p>

**3.DB Diagram**
<p align="center">
    <img src="./forREADME/DBDiagram.png">
    <sup style="color:#0AC5A8; font-weight: bolder;">- DB Diagram -</sup>
</p>

**4.테이블 정의서**
<p align="center">
    <img src="./forREADME/DBTableDefMem.png">
    <img src="./forREADME/DBTableDefTravel.png">
    <sup style="color:#0AC5A8; font-weight: bolder;">- DB Table Def -</sup>
</p>

**5.클래스 Diagram**
<p align="center">
    <img src="">
    <sup style="color:#0AC5A8; font-weight: bolder;">- Class Diagram -</sup>
</p>
