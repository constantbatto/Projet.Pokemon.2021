<html><head><title></title></head>
<body>
<?php
$user=$_POST['username'];
$password=$_POST['password'];
$ud_id=$_POST['ud_id'];
$ud_name=$_POST['ud_name'];
$ud_birthday=$_POST['ud_birthday'];

$db="ins3112019";
//$link = mysql_connect("localhost","root", "");
$link = new mysqli("localhost", $_POST['username'], $_POST['password']);
if ($link->connect_errno){
  die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db)
or die("Couldn't open $db: ".$link->error);
$link->query(" UPDATE pokemons  SET NomPokemon='$ud_NomPokemon' , Numero='$ud_Numero' , AttaqueSpe='$ud_AttaqueSpe' , DefenseSpe='$ud_Attaque' , Attaque='$ud_NomSpecificite' , Defense='$ud_Defense' , Vitesse='$ud_Vitesse' WHERE id='$ud_id'");
echo "Record Updated";
$link->close();
?>
<form method="POST" action="pokemons_update_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Change Another">
</form><br>

<form method="POST" action="pokemons_dbase_interface.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Dbase Interface">
</form>

</body>
</html>
