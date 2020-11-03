function hide(name){
  //ラジオボタンオブジェクトを取得する
  var radios = document.getElementsByName(name);
 
  //取得したラジオボタンオブジェクトから選択されたものを探し出す
  var result;
  for(var i=0; i<radios.length; i++){
    if (radios[i].checked) {
      //選択されたラジオボタンのvalue値を取得する
      result = radios[i].value;
      break;
    }
  }
  //value値を表示する
  // alert("value値は" + result + "です");
  // radios.addEventListener("onClick", (e) => {
    // console.log(e);
    // debugger
  if (result == 1){
    document.getElementById( "sprits" ).value = "" ;
    let a = document.getElementById("sprits")
    a.removeAttribute("type","hidden");
    // if (result ==2){
    //   a.removeAttribute("type","hidden");
    // }
  } else if(result == 2){
    let a = document.getElementById("sprits")
    a.setAttribute("type","hidden");
    document.getElementById( "sprits" ).value = "なし" ;
  }
// })
}
window.addEventListener("onChange", hide);