<html><head><title>pokemons Insert Record</title></head>
<body>
<?php
$NomPokemon=$_POST['NomPokemon'];
$Numero=$_POST['Numero'];
$AttaqueSpe=$_POST['AttaqueSpe'];
$DefenseSpe=$_POST['DefenseSpe'];
$Attaque=$_POST['Attaque'];
$Defense=$_POST['Defense'];
$Vitesse=$_POST['Vitesse'];
$NomType=$_POST['NomType'];
$NomObjet=$_POST['NomObjet'];



$db="pokemon2019";
//$link = mysql_connect("localhost","in311","test");
$link = new mysqli("localhost",$_POST['username'],$_POST['password'],"pokemon2019","3308");
if ($link->connect_errno){
  die("Couldn't connect to MySQL ".$link->connect_error);
}



$link->select_db($db) or die("Select Error: ".$link->error);
$result=$link->query("INSERT INTO pokemons(NomPokemon, Numero, AttaqueSpe, Attaque, Defense, DefenseSpe, Vitesse, NomObjet, NomType) VALUES ('$NomPokemon','$Numero','$AttaqueSpe','$Attaque','$Defense','$DefenseSpe','$Vitesse','$NomObjet','$NomType')")or die("Insert Error: ".$link->error);



$link->close();
print "Record added\n";
?>
<form method="POST" action="pokemons_insert_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Entrer une autre donnée">
</form>
</body>
</html>
