(function(){
  // Add new form field on poll create/update
  $(document).ready(function(){
    $('.field').last().after('<i class="fa fa-plus"></i>');

    function replaceAttr (element, attrName, text, replaceWith) {
      let change = $(element).attr(attrName).replace(text, replaceWith);
      $(element).attr(attrName, change);
    }

    $('.fa-plus').on('click', function(){
      let lastOption = $('.field').length - 2;
      let lastFormField = $('.field').last().clone();

      lastFormField.children().each(function(index, val){
        let text = lastOption + '';
        let replaceWith = ((lastOption + 1) + '');

        if ($(this).is('input')) {
          $(this).val('')
          replaceAttr(this, 'name', text, replaceWith);
          replaceAttr(this, 'id', text, replaceWith);
        }
        if ($(this).is('label')) {
          replaceAttr(this, 'for', text, replaceWith);
        }
      });
      $('.field').last().after(lastFormField);
    });
  });
})();
