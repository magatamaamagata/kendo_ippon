    <!DOCTYPE html>
    <html lang="ja">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>3択クイズ（ラジオボタン）</title>
        <link rel="stylesheet" href="common.css">
      </head>
      <body>
        <header>
          <h1>ラジオボタンとJavaScriptの3択クイズ</h1>
        </header>
        <main>
          <h2>Q. スマートフォンを日本市場で展開したことがないのはどれ？</h2>
          <form id="choice">
            <div class="choice" id="AAPL">
              <input type="radio" id="choice1" name="q" value="AAPL" />
              <label for="choice1">Apple</label>
            </div>
            <div class="choice" id="GOOG">
              <input type="radio" id="choice2" name="q" value="GOOG" />
              <label for="choice2">Google</label>
            </div>
            <div class="choice" id="AMZN">
              <input type="radio" id="choice3" name="q" value="AMZN" />
              <label for="choice3">Amazon</label>
            </div>
          </form>
          <div id="result"></div>
        </main>
        <script>
          const writeResult = val => {
            const result = document.getElementById("result");
            if (val == atob("QU1aTg==")) { result.innerText = "正解！"; result.className = "correct"; }
            else { result.innerText = "不正解…"; result.className = "incorrect"; }
          };
          (() => document.getElementById("choice").q.forEach(el => el.addEventListener("change", ev => writeResult(ev.target.value))))();
        </script>
      </body>
    </html>
    