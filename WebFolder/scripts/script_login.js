$(document).ready(function(){


  $('#form_login').submit(function (event) {
    event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

    var formContent = $(this).serialize();

    $.ajax(
        {
        method: "POST",
        url : "/4DACTION/wForm_Connection",
        data: formContent
        }
      )
      .done(
        function(response){
          if (response.error_code == 0) {
            //window.location = "/login.shtml"
            alert("Utilisateur connecté.");
            window.location = "/orda.shtml"
          }
          else {
            alert(response.error_message);
          }
        }
      );
  });
});