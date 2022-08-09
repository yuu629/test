
var result = "";
var is_calc = false;

// 初期表示
window.onload = function () {
  result = document.getElementById('result');
};

function c_click(){
  result.value = "0";
  is_calc = false;
}
// 数字キー押下
function num_click(val){
  if(is_calc)  result.value = "0";
  is_calc = false;

  if(result.value =="0" && val == "0"){
    result.value = "0";
  }else if(result.value == "0" && val == "."){
    result.value = "0.";
  }else if(result.value == "0"){
    result.value = val;
  }else{
    result.value += val;
  }
}

function ope_click(val){
  if(is_calc)  is_calc = false;

  if(is_ope_last()){
    result.value = result.value.slice(0, -1) + val;
  } else {
    result.value += val;
  }
}

// =キークリック
function equal_click(){
  if(is_ope_last())  result.value = result.value.slice(0, -1);

  var temp = new Function("return " + result.value.replaceAll("×", "*").replaceAll("÷", "/"))();
  if(temp == Infinity || Number.isNaN(temp)){
    result.value = "Error";
  }else{
    result.value = temp;
    is_calc = true;
  }
}
function is_ope_last(){
  return ["+","-","×","÷",].includes(result.value.toString().slice(-1));
}
