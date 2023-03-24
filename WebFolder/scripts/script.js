
$(document).ready(function(){


  $('#form_inscription').submit(function (event) {
    event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

    var formContent = $(this).serialize();

    $.ajax(
        {
        method: "POST",
        url : "/4DACTION/wForm_Inscription",
        data: formContent
        }
      )
      .done(
        function(response){
          if (response.error_code == 0) {
            // rediriger vers la page d'inscription
            window.location = "/inscription.shtml"
            alert("Utilisateur créé avec succès");
            // alert('OK');
          }
          else {
            alert(response.error_message);
          }
        }
      );
  });
});

