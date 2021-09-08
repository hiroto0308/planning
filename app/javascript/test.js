$(document).on('click', '.create', function() {
  var text  = $('#text _' + $(this).attr('id').replace('comment_submit_', '')).val();
// ----------------------------------------------------------------------------
  if(text == '') {
    alert('コメントを入力してください。');               // 投稿が空欄だった場合の振る舞い
    return false;    
// ----------------------------------------------------------------------------
  } else {
// ----------------------------------------------------------------------------
    $.ajax({
      url: '/comments/create',
      data: { event_id: $('#event_id').val(),     // まずはここ！
              text: text                 // 何か投稿があった時の振る舞い
            },
      dataType: 'json'
    })
// ----------------------------------------------------------------------------
    .done(function(data) {
      var html = buildHTML(data);
      $('.comments').append(html);             // json形式で値を受け取った後の処理
      $('.text').val('');
    })
// ----------------------------------------------------------------------------
    .fail(function(data) {
      alert('エラーが発生しました。')               // 受け取り失敗の場合の処理
    });
// ----------------------------------------------------------------------------
  }
  function buildHTML(data) {
   
    var html = `<p>
    <strong><%= link_to comment.user.nickname, root_path %>：</strong>
    <%= ${ data.text } %>
    <%= link_to '(削除)', comment_path(comment.id), method: :delete %>
  </p>`
    return html;
  }
});