<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function categoryChange(e) {
	var good_a = ["콜드 브루 커피",
		"나이트로 바닐라크림",
		"포레스트 콜드브루",
		"나이트로 콜드브루",
		"돌체 콜드브루",
		"바닐라 크림 콜드브루",
		"콜드브루","콜드브루몰트",
		"콜드브루 오트라떼",
		"콜드 브루 플로트",
		"프렌치 애플 타르트 나이트로"];
	var good_b = ["브루드커피",
		"아이스 커피",
		"오늘의 커피"];
	var good_c = ["에스프레소",
		"라벤더 카페 브레베",
		"럼 샷 코르타도",
		"바닐라 빈 라떼",
		"바닐라 스타벅스 더블샷",
		"바닐라 플랫 화이트",
		"블론드 바닐라 더블샷 마끼아또",
		"블론드 에스프레소 라떼",
		"스타벅스 돌체 라떼",
		"아이스 라벤더 카페 브레베",
		"아이스 바닐라 빈 라떼",
		"아이스 블론드 에스프레소 라떼",
		"아이스 스타벅스 돌체라떼",
		"아이스 카라멜 마끼아또",
		"아이스 카페 아메리카노",
		"아이스 카페라떼",
		"아이스 카페모카",
		"아이스 카푸치노",
		"아이스 화이트 초콜릿 모카",
		"에스프레소",
		"에스프레소 마끼아또",
		"에스프레소 콘파나",
		"제주 별다방 땅콩라떼",
		"카라멜 마끼아또",
		"카페 라떼",
		"카페 모카",
		"카페 아메리카노",
		"카푸치노",
		"커피 스타벅스 더블샷",
		"클래식 아포가토",
		"헤이즐넛 스타벅스 더블샷",
		"화이트 초콜릿 모카"];
	var good_d = ["프라푸치노",
		"더블 에스프레소 칩 프라푸치노",
		"돌체 카라멜 칩 커피 프라푸치노",
		"모카 프라푸치노",
		"바나나 크림 다크 초코 블렌디드",
		"바닐라 크림 프라푸치노",
		"에스프레소 프라푸치노",
		"자바 칩 프라푸치노",
		"제주 까망 크림 프라푸치노",
		"제주 별다방 땅콩 프라푸치노",
		"제주 쑥떡 크림 프라푸치노",
		"제주 유기농 말차로 만든 프라푸치노",
		"초콜릿 크림 칩 프라푸치노",
		"카라멜 프라푸치노",
		"화이트 딸기 크림 프라푸치노",
		"화이트 초콜릿 모카 프라푸치노",
		"화이트 타이거 프라푸치노"];
	var good_e = ["블렌디드",
		"딸기 딜라이트 요거트 블렌디드",
		"딸기 레몬 블렌디드",
		"망고 바나나 블렌디드", 
		"망고 패션 후르츠 블렌디드",
		"민트 초콜릿 칩 블렌디드",
		"제주 천혜향 블랙 티 블렌디드",
		"피치 & 레몬 블렌디드"];
	var good_f = ["스타벅스 피지오",
		"블랙 티 레모네이드 피지오",
		"쿨 라임 피지오",
		"패션 탱고 티 레모네이드 피지오"];
	var good_g = ["티(티바나)",
		"돌체 블랙 밀크 티",
		"라임 패션 티",
		"민트 블렌드 티",
		"별궁 오미자 유스베리 티",
		"스타벅스 파인애플 선셋 아이스 티",
		"아이스 돌체 블랙 밀크 티",
		"아이스 라임 패션 티",
		"아이스 민트 블렌드 티",
		"아이스 별궁 오미자 유스베리 티",
		"아이스 얼 그레이 티",
		"아이스 유스베리 티",
		"아이스 유자 민트 티",
		"아이스 잉글리쉬 브렉퍼스트 티",
		"아이스 자몽 허니 블랙 티",
		"아이스 제주 유기 녹차",
		"아이스 제주 유기농 말차로 만든 라떼",
		"아이스 차이 티 라떼",
		"아이스 캐모마일 블렌드 티",
		"아이스 콩고물 블랙 밀크 티",
		"아이스 패션 푸르트 티",
		"아이스 푸를 청귤 민트 티",
		"아이스 히비스커스 블렌드 티",
		"얼 그레이 티",
		"유스베리 티",
		"유자 민트 티",
		"잉글리쉬 브렉퍼스트 티",
		"자몽 허니 블랙 티",
		"제주 유기 녹차",
		"제주 유기농 말차로 만든 라떼",
		"차이 티 라떼",
		"캐모마일 블렌드 티",
		"콩고물 블랙 밀크 티",
		"패션 푸르트 티",
		"피치 젤리 아이스 티",
		"피치 젤리 티",
		"히비스커스 블렌드 티",
		"티(티바나)",
		"돌체 블랙 밀크 티",
		"라임 패션 티",
		"민트 블렌드 티",
		"별궁 오미자 유스베리 티",
		"스타벅스 파인애플 선셋 아이스 티",
		"아이스 돌체 블랙 밀크 티",
		"아이스 라임 패션 티",
		"아이스 민트 블렌드 티",
		"아이스 별궁 오미자 유스베리 티",
		"아이스 얼 그레이 티",
		"아이스 유스베리 티",
		"아이스 유자 민트 티",
		"아이스 잉글리쉬 브렉퍼스트 티",
		"아이스 자몽 허니 블랙 티",
		"아이스 제주 유기 녹차",
		"아이스 제주 유기농 말차로 만든 라떼",
		"아이스 차이 티 라떼",
		"아이스 캐모마일 블렌드 티",
		"아이스 콩고물 블랙 밀크 티",
		"아이스 패션 푸르트 티",
		"아이스 푸를 청귤 민트 티",
		"아이스 히비스커스 블렌드 티",
		"얼 그레이 티",
		"유스베리 티",
		"유자 민트 티",
		"잉글리쉬 브렉퍼스트 티",
		"자몽 허니 블랙 티",
		"제주 유기 녹차",
		"제주 유기농 말차로 만든 라떼",
		"차이 티 라떼",
		"캐모마일 블렌드 티",
		"콩고물 블랙 밀크 티",
		"패션 푸르트 티",
		"피치 젤리 아이스 티",
		"피치 젤리 티",
		"히비스커스 블렌드 티"];
	var good_h = ["기타제조음료",
		"샤이닝 머스캣 에이드",
		"스타벅스 슬래머NEW",
		"스타벅스 슬래머",
		"시그니처 핫 초콜릿",
		"아이스 시그니처 초콜릿",
		"플러피 판다 아이스 초콜릿",
		"플러피 판다 핫 초콜릿",
		"라임 플로터 위드 리저브 CB 샷",
		"스팀 우유",
		"아이스 제주 까망 라떼",
		"오렌지 플로터 위드 리저브 CB 샷",
		"우유",
		"제주 까망 라떼",
		"제주 쑥쑥 라떼",
		"제주 청귤 레모네이드"];
	var good_i = ["스타벅스 주스(병음료)",
		"기운내라임 190ML",
		"파이팅 청귤 190ML",
		"한방에 쭉 감당 190ML",
		"도와줘 흑흑 190ML",
		"딸기주스 190ML",
		"망고주스 190ML",
		"수박주스 190ML",
		"케일&사과주스 190ML",
		"토마토주스 190ML",
		"퍼플베리 굿 190ML",
		"한라봉주스 190ML",
		"햇사과 주스 190ML",
		"블루베리 요거트 190ML",
		"치아씨드 요거트 190ML"];
	var target = document.getElementById("good");

	if(e.value == "a") var z = good_a;
	else if(e.value == "b") var z = good_b;
	else if(e.value == "c") var z = good_c;
	else if(e.value == "d") var z = good_d;
	else if(e.value == "e") var z = good_e;
	else if(e.value == "f") var z = good_f;
	else if(e.value == "g") var z = good_g;
	else if(e.value == "h") var z = good_h;
	else if(e.value == "i") var z = good_i;

	target.options.length = 0;

	for (x in z) {
		var opt = document.createElement("option");
		opt.value = z[x];
		opt.innerHTML = z[x];
		target.appendChild(opt);
	}
}
</script>
<body>
	<form>
		<fieldset>
			<legend>커스텀등록</legend>
			<select onchange="categoryChange(this)">
				<option>메뉴를 선택해주세요</option>
				<option value="a">콜드브루</option>
				<option value="b">브루드커피</option>
				<option value="c">에스프레소</option>
				<option value="d">프라푸치노</option>
				<option value="e">블렌디드</option>
				<option value="f">스타벅스피지오</option>
				<option value="g">티(티바나)</option>
				<option value="h">기타제조음료</option>
				<option value="i">스타벅스주스(병음료)</option>
			</select>
			
			<select id="good">
				<option>하위 메뉴를 선택해주세요</option>
			</select>
			
			
			
			<div>
				<!-- 게시글순서 -->
				<label>NO</label><input name="" id="" placeholder="">
			</div>
			<div>
				<!-- 사용자가 작성하려고하는 메뉴이름 -->
				<label>메뉴 이름</label><input type="" name="" id="" placeholder="">
			</div>
			<div>
				<!-- 베이스음료에 기본으로 제공되는 옵션을 제외한 추가옵션 -->
				<label>추가된 퍼스널옵션</label><input name="" id="" placeholder="">
			</div>
			<div>
				<label>작성자</label><input name="" id="" placeholder="">
			</div>
			<div>
				<label>작성시간</label><input name="" id="" placeholder="">
			</div>
		</fieldset>
	</form>
	<%@ include file="/WEB-INF/views/include/include_footer.jsp" %>
</body>
</html>