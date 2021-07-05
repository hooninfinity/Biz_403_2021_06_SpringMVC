document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector("nav#main_nav");

  nav.addEventListener("click", (e) => {
    let tagName = e.target.tagName;
    let urlPath = `${rootPath}`;
    if (tagName === "LI") {
      let menuText = e.target.textContent;
      if (menuText === "HOME") {
        urlPath += "/";
      } else if (menuText === "CUSTOM") {
        urlPath += "/custom";
      } else if (menuText === "BOARD") {
        urlPath += "/board";
      } else if (menuText === "LOGIN") {
        urlPath += "/member";
      } else if (menuText === "JOIN") {
        urlPath += "/member/join";
      }

      location.href = urlPath;
    }
  });
});
