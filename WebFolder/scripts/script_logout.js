$(document).ready(function(){


    $('#form_logout').submit(function (event) {
      event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page
  
      var formContent = $(this).serialize();
  
      $.ajax(
          {
            method: "POST",
            url : "/4DACTION/wForm_Deconnection",
            data: formContent
          }
        )
        .done(
          function(response){
            if (response.error_code == 0) {
                location.reload(true);
            }
            else {
                alert(response.error_message);
            }
          }
        );
    });
  });