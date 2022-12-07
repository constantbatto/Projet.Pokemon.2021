<html><head><title>Types Delete Record</title></head>
<body>
<?php
$user=$_POST['username'];
$password=$_POST['password'];
$id=$_POST['id'];
$db="pokemon2019";
$link = new mysqli("localhost",$user,$password,"pokemon2019","3308");
if ($link->connect_errno){
 die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db)
or die("Couldn't open $db: ".$link->error);
$link->query("DELETE FROM  types where id=$id")or die("Delete Error: ".$link->error);
$link->close();
print "Donnée effacé.\n";
?>
<br><br>
<form method="POST" action="Types_delete_form.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="Effacer une autre Données">
</form><br>
<form method="POST" action="types_dbase_interface.php">
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">
<input type="submit" value="DBase Interface">
</form>
</body>
</html>
