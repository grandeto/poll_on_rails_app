(function(){
  // Disable poll form if voted
  $(document).ready(function(){

    function getCookie(cname) {
      var name = cname + "=";
      var ca = document.cookie.split(';');
      for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
          c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
          return c.substring(name.length, c.length);
        }
      }
      return "";
    }

    function checkVoted(cname) {
      let voted = getCookie(cname);
      if (voted != "") {
        $(':input').prop('disabled', true);
        $(':input[type="submit"]').val('voted');
      }
    }

    function getPollId() {
      let url = window.location.href.split('/');
      return url[url.length - 1];
    }

    checkVoted("poll_on_rails_voted" + getPollId());

  });
})();
