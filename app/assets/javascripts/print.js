function funcprint(){

  var printArea = document.getElementsByClassName("print-area");
  $('body').append('<div id="print" class="printBc"></div>');
  $(printArea).clone().appendTo('#print');

  //プリントしたいエリア意外に、非表示のcssが付与されたclassを追加
  $('body > :not(#print)').addClass('print-off');
  window.print();
  //window.print()を実行した後、作成した「#print」と、非表示用のclass「print-off」を削除
  $('#print').remove();
  $('.print-off').removeClass('print-off');
};
