<html><head><title>Dresseurs </title><link rel="stylesheet" href="../styles.css"></head>
<body>
<?php
$db="pokemon2019";
$link = new mysqli("localhost", $_POST['username'], $_POST['password'],"pokemon2019","3308");
if ($link->connect_errno){
 die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db) or die("Couldn't open $db: ".$link->error);

$result = $link->query( "SELECT * FROM Dresseurs" ) or die("SELECT Error: ".$link->error);
$num_rows = $result->num_rows;

print "Il y a $num_rows dresseurs enregistré.<p>";
print "<table width=200 border=1>\n";

while ($get_info = $result->fetch_row()){ 
	print "<tr>\n";
	foreach ($get_info as $field) {
		print "\t<td><font face=arial size=1/>$field</font></td>\n";
	}
	print "</tr>\n";
}
print "</table>\n";
$result->free();
$link->close();
?>
<br>
<form method="POST" action="dresseurs_delete_record.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<pre>
Entrer le nom du dresseur à effacer: <input type="text" name="NomDresseur" size="5">
<input type="submit" value="Entrer"><input type="reset">
</pre>
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
