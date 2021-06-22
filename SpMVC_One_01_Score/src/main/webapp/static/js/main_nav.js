document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("nav#main_nav");

  nav.addEventListener("click", (e) => {
    let tagName = e.target.tagName;
    if (tagName === "LI") {
      let menuText = e.target.textContent;
      // `` backTit : 역 작은 따옴표
      // JS에서 변수를 포함하는 문자열을 생성할 때 사용한다
      // let urlPath = rootPath
      // 각각의 메뉴를 클릭했을때 공통으로 필요한
      // rootPath 문자열을 변수에 세팅
      let urlPath = `${rootPath}`;

      if (menuText === "HOME") {
        // urlPath += rootPath + "/";
        urlPath += "/";
      } else if (menuText === "학생정보") {
        urlPath += "/student";
      } else if (menuText === "성적일람표") {
        urlPath += "/score";
      } else if (menuText === "로그인") {
        urlPath += "/login";
      }

      // alert(`내가 가야할 곳 ${urlPath}`);
      location.href = urlPath;
    }
  });
});
