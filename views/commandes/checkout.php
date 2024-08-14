<div class="container"><br>
    <h5>Date : <?= $date = date("d-m-y"); ?></h5>
    <hr>
    <h5>Expédition à : <b><?= $_SESSION['Utilisateur']->nom; ?></b></h5>
    <hr>
    <div class="row">
        Articles (<?= $_SESSION['quantite']; ?>) : <?= $_SESSION['total']; ?> $
    </div>

    <div class="row">
        Frais d'expédition : 9 $
    </div>

    <div class="row">
        Total avant taxes : <?= $_SESSION['soustotal']; ?> $
    </div>

    <div class="row">
        Taxes estimées : <?= $_SESSION['taxesTotal']; ?> $
    </div>

    <div class="row">
        <h3>Prix total : <?= $_SESSION['prixTotal']; ?> $</h3>
    </div>
    <hr>
</div>

<h5>Adresse d'expédition :</h5>
<div class="container">
    <hr>
    <?php
    echo $_SESSION['Utilisateur']->nom . " " . $_SESSION['Utilisateur']->prenom . ".";
    echo "<br>";
    echo $_SESSION['adresseLivraison']->rue . "," . $_SESSION['adresseLivraison']->ville . "," . $_SESSION['adresseLivraison']->province . ".";
    echo "<br>";
    echo $_SESSION['Utilisateur']->telephone;
    ?>
    <hr>
    <?php if (isset($_SESSION['Utilisateur'])) { ?>
        <div id="paypal-button-container"></div>
        <script src="https://www.paypal.com/sdk/js?client-id=AWeN6YvzFMYgSOpdFiKM5WKS49g4U_z5-yiJnelPs5vNlxUDPweOv6SEsflOS1flEZoSO1M695YK3DgL"></script>
        <script>
            paypal.Buttons({
                createOrder: function(data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                            amount: {
                                value: '<?= $_SESSION['prixTotal']?>'
                            }
                        }]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        console.log(details);
                        window.location.replace("success.php");
                    });
                },
            }).render('#paypal-button-container');
        </script>
    <?php } ?>
    <hr>
</div>
