function comment() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    console.log(formData);
    const params = location.pathname.replace(/[^0-9]/g, '');//skill_idを取得
    console.log(params);
    XHR.open("POST", `/skills/${params}/compares/${params}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
      console.log(item)
      debugger;
    
      const list = document.getElementById("list");
      const formText = document.getElementById("comment");
      const HTML = `
        <div class="post" data-id=${item.id}>
          <div class="post-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-comment">
          ${item.comment}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
  });
}
window.addEventListener("load", comment);