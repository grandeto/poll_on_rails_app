(function(){
  // Stop deleting of poll options when poll has only 2 options
  $(document).ready(function(){

    function getOptionsCount() {
      return $('.delete-option').length;
    }

    $('.delete-option').on('click', function(event){
      if(getOptionsCount() < 3) {
        alert('Sorry, deleting poll options under two is not allowed.');
        return false;
      }
    });
  });
})();
