# pagination
* 많은 데이터 List가 select 되었을때 전체 list를 한화면에 보여주면 보는데 상당히 애로사항이 있을 것이다.
* 한 화면에 일정한 list의 분량만 보여주고
* list 하단에 page navigation을 표현하여
* page num를 클릭하면 이후 list를 조회하여 보여주는 방식

## pagination 설계할때 요구사항
* 한 화면에 몇개의 list를 보여줄 것인가 : 보통 10개 정도 list
* page navigation의 개수는 몇개로 할 거인가 : 5개 또는 10개 정도 표현
* 처음으로 가기 : 1 page list 보기
* 끝으로 가기 : 제일 마지막 list 중에 보이기
* 이전으로, 이후로 가기 : 현재 보고 있는 page에서 앞, 뒤로 가기

* 보고 있는 화면에서 page nav 번호를 클릭했을 때 controller에 전달하는 값
가장 좋은 방법은 page num 만 전달하기, 검색어와 함께 전달하기, 검색어 정렬기준과 함께 전달하기 등이 필요하다.

## 이 프로젝트에서 pagination 구현하기
* SQL의 SELECT는 표준 SQL SELECT 만 사용하기
* Java 코드에서 pagination 구현하기
* 1.8 미만에서 사용하는 코드와 1.8 이상에서 구현하는 코드
* 1.8 이상의 코드 : Lambda, Stream(List데이터에 대한)