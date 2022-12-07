<html><head><title>Equipe Delete Record</title></head>
<body>
<?php
$user=$_POST['username'];
$password=$_POST['password'];
$NomDresseur=$_POST['NomDresseur'];
$db="pokemon2019";
$link = new mysqli("localhost",$user,$password,"pokemon2019","3308");
if ($link->connect_errno){
 die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db)
or die("Couldn't open $db: ".$link->error);
$link->query("DELETE FROM  PossedeEquipe where '$NomDresseur'=NomDresseur")or die("Delete Error: ".$link->error);
$link->close();
print "Equipe effacé.\n";
?>
<br><br>
<form method="POST" action="equipes_delete_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Effacer une autre Equipe">
</form><br>
<form method="POST" action="equipes_dbase_interface.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Menu">
</form>
<br>
<form method="POST" action="../../pokemon">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Menu Principal">	

</form><br>
</body>
</html>
