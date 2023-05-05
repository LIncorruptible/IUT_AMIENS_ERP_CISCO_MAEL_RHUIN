
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

  $('#btn_boutiques').click(function (event) {
    event.preventDefault();
  
    $.ajax(
      {
        method: "POST",
        url : "/4DACTION/web_orda_loadBoutiques"
      }
    )
    .done(
      function(response){
        let str = "";
  
        for(let i = 0; i< response.length; i++){
          str += response[i].Nom + "<br>";
        }
  
        $("#liste_boutiques").html(str);
      }
    );
  });
});



