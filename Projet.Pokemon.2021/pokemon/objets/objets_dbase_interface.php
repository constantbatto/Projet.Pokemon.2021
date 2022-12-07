<html><head><title>Mise à jour des Objet</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">
<h3>Mise à jour des Objet</h3>
<?php
$_POST['username'] = "pokemonUser";
$_POST['password'] = "pokemon1234";
?>

<form method="POST" action="objets_insert_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Entrer un objet">
</form><br><br>
<form method="POST" action="objets_display_records.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Voir les objets">
</form><br><br>
<form method="POST" action="objets_delete_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Effacer un objet">
</form>
<br><br>
<form method="POST" action="../../pokemon">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Menu Principal">	

</form><br><br>
</td></tr></table>
</body>
</html>
<footer>
  <p>Projet LSIN311-2019
  Seck-Batto</p>
</footer>
</body>
</html>
