<html><head><title>Trouver le pokémon fort</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">
<h3>Félicitation !</h3>
    
<?php
$nPokemonA=$_POST['NomPokemonA'];
//$nPokemonB=$_POST['nPokemon'];

$db="pokemon2019";
//$link = mysql_connect("localhost","in311","test");
$link = new mysqli("localhost",$_POST['username'],$_POST['password'],"pokemon2019","3308");
if ($link->connect_errno){
  die("Couldn't connect to MySQL ".$link->connect_error);
}

$link->select_db($db) or die("Select Error: ".$link->error);
$result=$link->query("SELECT B.NomPokemon AS nPokemon, ((B.DefenseSpe > A.AttaqueSpe) + (B.AttaqueSpe > A.DefenseSpe) + (B.Attaque > A.Defense) + (B.Defense > A.Attaque) + (B.Vitesse > A.Vitesse)) AS 'totale' FROM pokemons A, pokemons B WHERE A.NomPokemon ='$nPokemonA' AND B.Numero<>A.Numero AND ((A.DefenseSpe > B.AttaqueSpe) + (A.AttaqueSpe > B.DefenseSpe) + (A.Attaque > B.Defense) + (A.Defense > B.Attaque) + (A.Vitesse > B.Vitesse)) < ((B.DefenseSpe > A.AttaqueSpe) + (B.AttaqueSpe > A.DefenseSpe) + (B.Attaque > A.Defense) + (B.Defense > A.Attaque) + (B.Vitesse > A.Vitesse)) GROUP BY totale ORDER by totale DESC LIMIT 1")or die("Insert Error: ".$link->error);
$row=$result->fetch_array(MYSQLI_ASSOC);

//if ($row['nPokemon']) exist {
print "Le pokémon fort contre ";
print $nPokemonA; 
print " est ";
print "<tr>".$row['nPokemon']."</tr>"; 
print " !";
//} else {
 // print "il n'y a pas de counter";
//}
$link->close();
// foreach ($_POST as $key => $value){
//  echo "{$key} = {$value}\r\n";
//}

//print "Record added\n";
?>
<br><br>

<form method="POST" action="combats2_insert_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<tr><td><label><input type="submit" value="Chercher pour un autre pokémon"></td></tr>
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
<?php
// foreach ($_POST as $key => $value){
//  echo "{$key} = {$value}\r\n";
//}
//<option value="<?php echo $row['sumB']; "><?php echo $row['sumB']; </option>
?>