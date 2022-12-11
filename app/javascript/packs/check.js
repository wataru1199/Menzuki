/* global $*/

  $(function() {
    // <!--// 1. 「全選択」する-->
    $('#all').on('click', function() {
      $("input[name^=deletes").prop('checked', this.checked);
    });
    // <!--// 2. 「全選択」以外のチェックボックスがクリックされたら、-->
    $("input[name^=deletes").on('click', function() {
      if ($('#check_box :checked').length == $('#check_box :input').length) {
        // <!--// 全てのチェックボックスにチェックが入っていたら、「全選択」 = checked-->
        $('#all').prop('checked', true);
      } else {
        // <!--// 1つでもチェックが入っていたら、「全選択」 = checked-->
        $('#all').prop('checked', false);
      }
    });
  });
