<html><head><title>pokemons </title></head>
<body>
<?php
$db="pokemon2019";
$link = new mysqli("localhost", $_POST['username'], $_POST['password'],"pokemon2019","3308");
if ($link->connect_errno){
 die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db) or die("Couldn't open $db: ".$link->error);

$result = $link->query( "SELECT * FROM pokemons" ) or die("SELECT Error: ".$link->error);
$num_rows = $result->num_rows;

print "Il y a $num_rows données.<p>";
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
<form method="POST" action="pokemons_delete_record.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<pre>
Enter Line Number to Delete: <input type="text" name="id" size="5">
<input type="submit" value="Entrer"><input type="reset">
</pre>
</form>
</body>
</html>
