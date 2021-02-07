$(function(){
//印刷ボタンをクリックした時の処理
$('.print-secondary').on('click', function(){

//プリントしたいエリアの取得
var printArea = document.getElementsByClassName("print-area");

//プリント用の要素「#print」を作成し、上で取得したprintAreaをその子要素に入れる。
$('body').append('<div id="print" class="printBc"></div>');
$(printArea).clone().appendTo('#print');

//この下に、以降の処理が入ります。
$('body > :not(#print)').addClass('print-off');
window.print();
$('#print').remove();
$('.print-off').removeClass('print-off');
 });
});
