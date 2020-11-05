function comment() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    const post = document.getElementById("getid");
    console.log(post)
    const skillId = post.getAttribute("data-skillId");
    console.log(skillId)
    //日付オブジェクトを作成する
    var dd = new Date();
    //「年」を取得する
    var YYYY = dd.getFullYear();
    //「月」を取得する
    var MM = dd.getMonth()+1;
    //「日」を取得する
    var DD = dd.getDate();
    console.log(dd)

    XHR.open("POST", `/skills/${skillId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    console.log(formData);
    // debugger
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.comment;
      console.log(item)
      const list = document.getElementById("list");
      const formText = document.getElementById("comment");

      const HTML = `
        <div class="comment" data-id=${item.id}>
          <div class="comment-date">
            投稿日時：${YYYY}/${MM}/${DD};
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