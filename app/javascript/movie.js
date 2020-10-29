// // 2. This code loads the IFrame Player API code asynchronously.
//       // 2. This code loads the IFrame Player API code asynchronously非同期通信でiframeplayerのapiをロードしている.
//       var tag = document.createElement('script');//tagName で指定された HTML 要素を生成
//       tag.src = "https://www.youtube.com/iframe_api";//リソースの場所を特定する
//       var firstScriptTag = document.getElementsByTagName('script')[0];
//       //documentメソッドはブラウザ上で表示された情報(HTML)を操作する事ができるオブジェクト.
//       //getElementsByTagNameは指定されたタグ名を持つ要素の HTMLCollection（配列） を返す。DOMツリーと自動で同期し続ける。その配列の[0]の要素を取り出している。
//       firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
//       //parentNode.insertBeforeノードを参照ノードの前に、指定された親ノードの子として挿入します。
//       console.log(firstScriptTag);
      
//       // 3. This function creates an <iframe> (and YouTube player)
//       //    after the API code downloads.
//       var player;
//       function onYouTubeIframeAPIReady() {
//         player = new YT.Player('player', {
//           height: '360',
//           width: '640',
//           videoId: 'izQsgE0L450',
//           events: {
//             'onReady': onPlayerReady,
//             'onStateChange': onPlayerStateChange
//           }
//         });
//       }

      
//       // 4. The API will call this function when the video player is ready.
//       function onPlayerReady(event) {
//         event.target.playVideo();
//       }
//       // 5. The API calls this function when the player's state changes.
//       //    The function indicates that when playing a video (state=1),
//       //    the player should play for six seconds and then stop.
//       var done = false;
//       function onPlayerStateChange(event) {
//         if (event.data == YT.PlayerState.PLAYING && !done) {
//           console.log(onPlayerStateChange);
//           debugger
//           setTimeout(stopVideo, 6000);
//           done = true;
//         }
//       }
//       function stopVideo() {
//         player.stopVideo();
//         // console.log(stopVideo);
//         // debugger
//       }
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
function onYouTubeIframeAPIReady() {
player = new YT.Player('player', {
  height: '360',
  width: '640',
  videoId: 'bjmBJ1Fl0cs',
  events: {
    'onReady': onPlayerReady,
    'onStateChange': onPlayerStateChange
  }
});
}

function onPlayerReady(event) {
  event.target.playVideo();
}

var done = false;
function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.PLAYING && !done) {
    setTimeout(stopVideo, 6000);
    done = true;
  }
}
function stopVideo() {
  player.stopVideo();
}