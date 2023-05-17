$(document).ready(function(){
    $('#btn_loadBoutique').click(function (event) {

        event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

        $.ajax(
        {
            method: "GET",
            url: "/4DACTION/web_orda_loadBoutiques"
        }
        )
        .done(
            function (response) {
            let str = "";

            for (let i = 0; i < response.length; i++) {
                str += response[i].Nom + "<br>";
            }

            $("#liste_boutique").html(str);
            }
        );
    });

    $('#btn_loadBoutique_rest').click(function (event) {

        event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

        $.ajax(
        {
            method: "GET",
            url: "/rest/BOUTIQUE"
        }
        )
        .done(
            function (response) {
            let str = "";

            for (let i = 0; i < response.__ENTITIES.length; i++) {
                str += response.__ENTITIES[i].Nom + "<br>";
            }

            $("#liste_boutique_rest").html(str);
            }
        );
    });
});