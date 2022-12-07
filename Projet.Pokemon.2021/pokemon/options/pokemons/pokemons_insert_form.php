<html><head><title>Pokemon Insert Form</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">

    
<h3>Entrez un Pokemon</h3>
<form method="POST" action="pokemons_insert_record.php">
<!--The hidden fields are provided to maintain state.  They are used to pass the username and password from script to script.-->
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">

<table summary="Liste Pokemon" class="table table-bordered table-hover">
	  
<tr><td >Entrez un Pokemon :</td><td><input type="text" name=NomPokemon></td></tr>
<tr><td >Entrez son Numero :</td><td> <input type="text" name=Numero></td></tr>
<tr><td >Entrez l'AttaqueSpe :</td><td><input type="text" name=AttaqueSpe></td></tr>
<tr><td >Entrez la DefenseSpe :</td><td> <input type="text" name=DefenseSpe></td></tr>
<tr><td >Entrez l'Attaque :</td><td><input type="text" name=Attaque></td></tr>
<tr><td >Entrez la Defense :</td><td> <input type="text" name=Defense></td></tr>
<tr><td >Entrez la Vitesse :</td><td><input type="text" name=Vitesse></td></tr>

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
<tr><td>Objet :</td><td>
<select name="NomObjet" id="nobjet" class="reginput"/>
<option value="">Choisissez un objet</option>
<?php $s="SELECT NomObjet FROM objets;";
$q=$link->query($s) or die($s);
while($row=$q->fetch_array(MYSQLI_ASSOC))
{ ?>
<option value="<?php echo $row['NomObjet']; ?>"><?php echo $row['NomObjet']; ?></option>
<?php } ?>

<tr><td>Type :</td><td>
<select name="NomType" id="ntype" class="reginput"/>
<option value="">Choisissez un type</option>
<?php $s="SELECT NomType FROM types;";
$q=$link->query($s) or die($s);
while($row=$q->fetch_array(MYSQLI_ASSOC))
{ ?>
<option value="<?php echo $row['NomType']; ?>"><?php echo $row['NomType']; ?></option>
<?php } ?>
</select>
<tr><td ><label><input type=submit value="Entrer"><input type=reset></td></tr>
</table>
</form>
</td></tr></table>
</body>
</html>
