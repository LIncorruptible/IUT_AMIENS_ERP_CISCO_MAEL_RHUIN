$(document).ready(function() {

    $('#form_inscription').submit(function (event) {
        event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page
    
        var formContent = $(this).serialize();

        console.log(formContent);
    
        $.ajax(
            {
            method: "POST",
            url : "/4DACTION/wForm_Modification_Compte",
            data: formContent
            }
          )
          .done(
            function(response){
              if (response.error_code == 0) {
                window.location = "/account.shtml"
                alert("Utilisateur modifié avec succès");
              }
              else {
                alert(response.error_message);
              }
            }
        );
    });

});
  