function comment() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    const post = document.getElementById("getid");
    console.log(post)
    const skillId = post.getAttribute("data-skillid");
    console.log(skillId)
    XHR.open("POST", `/skills/${skillId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.comment;
      console.log(item)
      debugger;
    
      const list = document.getElementById("list");
      const formText = document.getElementById("comment");
      const HTML = `
        <div class="comment" data-id=${item.id}>
          <div class="comment-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-comment">
          ${item.text}
          </div>

        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}

/* <div class="name-comment"> */
// ${item.user.nickname}
// </div>
window.addEventListener("load", comment);