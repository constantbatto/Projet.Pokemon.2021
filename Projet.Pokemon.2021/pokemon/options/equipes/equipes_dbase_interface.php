<html><head><title>MAJ pour la table PossedeEquipe</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">
<h3>MAJ pour la table PossedeEquipe</h3>
<?php
$_POST['username'] = "pokemonUser";
$_POST['password'] = "pokemon1234";
?>


<form method="POST" action="equipes_insert_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Entrer une Donnée">
</form><br>
<form method="POST" action="equipes_display_records.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Voir les Données">
</form><br>
<form method="POST" action="equipes_delete_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Effacer une Donnée">
</form><br>
</td></tr></table>
</body>
</html>
