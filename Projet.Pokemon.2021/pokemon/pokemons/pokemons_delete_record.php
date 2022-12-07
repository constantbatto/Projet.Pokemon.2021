<html><head><title>Pokémons</title></head>
<body>
<?php
$user=$_POST['username'];
$password=$_POST['password'];
$Numero=$_POST['Numero'];
$db="pokemon2019";
$link = new mysqli("localhost",$user,$password,"pokemon2019","3308");
if ($link->connect_errno){
 die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db)
or die("Couldn't open $db: ".$link->error);
$link->query("DELETE FROM  Pokemons WHERE '$Numero'=Numero")or die("Delete Error: ".$link->error);
$link->close();
print "Pokémon effacé.\n";
?>
<br><br>
<form method="POST" action="pokemons_delete_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Effacer un autre pokémon">
</form><br>
<form method="POST" action="pokemons_dbase_interface.php">
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
