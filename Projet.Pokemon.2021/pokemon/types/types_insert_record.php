<html><head><title>Types</title></head>
<body>
<?php
$NomType=$_POST['NomType'];
$db="pokemon2019";
//$link = mysql_connect("localhost","in311","test");
$link = new mysqli("localhost",$_POST['username'],$_POST['password'],"pokemon2019","3308");
if ($link->connect_errno){
  die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db) or die("Select Error: ".$link->error);
$result=$link->query("INSERT INTO Types(NomType) VALUES ('$NomType')")or die("Insert Error: ".$link->error());
//$result=$link->query("INSERT INTO pokemons (name, birthday) VALUES ('$name','$birthday')")or die("Insert Error: ".$link->error());
$link->close();
print "Type enregistré\n";
?>
<form method="POST" action="types_insert_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Entrer un autre Type">
</form>
<br>
<form method="POST" action="../../pokemon">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Menu Principal">	

</form><br>
</body>
</html>
<footer>
  <p>Projet LSIN311-2019
  Seck-Batto</p>
</footer>
</body>
</html>