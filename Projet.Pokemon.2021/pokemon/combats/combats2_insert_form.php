<html><head><title>Trouver le pokémon fort</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">

    
<h3>Trouver le pokémon fort</h3>
<form method="POST" action="combats2_test_combat.php">
<!--The hidden fields are provided to maintain state.  They are used to pass the username and password from script to script.-->
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">

<table summary="Liste Pokemon" class="table table-bordered table-hover">
	  

<?php
$db="pokemon2019";
//$link = mysql_connect("localhost","in311","test");
$link = new mysqli("localhost",$_POST['username'],$_POST['password'],"pokemon2019","3308");
if ($link->connect_errno){
  die("Couldn't connect to MySQL ".$link->connect_error);
}



//$link->select_db($db) or die("Select Error: ".$link->error);
//$result=$link->query("INSERT INTO pokemons(NomPokemon, Numero, AttaqueSpe, Attaque, Defense, DefenseSpe, Vitesse) VALUES ('$NomPokemon','$Numero','$Attaque','$AttaqueSpe','$Defense','$DefenseSpe','$Vitesse')")or die("Insert Error: ".$link->error());
?>
<tr><td>Je cherche un pokémon fort contre :</td><td>
<select name="NomPokemonA" id="nPokemonA" class="reginput"/>
<option value="">Choisissez un Pokemon</option>
<?php $s="SELECT NomPokemon FROM Pokemons;";
$q=$link->query($s) or die($s);
while($row=$q->fetch_array(MYSQLI_ASSOC))
{ ?>
<option value="<?php echo $row['NomPokemon']; ?>"><?php echo $row['NomPokemon']; ?></option>
<?php } ?>

</select></td>
<tr><td><label><input type=submit value="Entrer"><input type=reset></td></tr>
</table>

</form>
<br>
<form method="POST" action="../../pokemon">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Menu Principal">	

</form><br>
</td></tr></table>
</body>
</html>
<footer>
  <p>Projet LSIN311-2019
  Seck-Batto</p>
</footer>
</body>
</html>
