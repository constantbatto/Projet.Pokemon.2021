<html>
<head><title>Données</title></head>
<body>
<?php
$username=$_POST['username'];
$password=$_POST['password'];
$db="pokemon2019";
$link = new mysqli("localhost", $username, $password,"pokemon2019","3308");
if ($link->connect_errno){
  die("Couldn't connect to MySQL ".$link->connect_error);
}
$link->select_db($db)
or die("Couldn't open $db: ".$link->error);
$result = $link->query( "SELECT * FROM possedeequipe" )
or die("SELECT Error: ".$link->error);
$num_rows = $result->num_rows;
print "Il y a $num_rows données.<P>";
print "<table width=200 border=1>\n";
while ($get_info = $result->fetch_row()){ 
print "<tr>\n";
foreach ($get_info as $field) 
print "\t<td><font face=arial size=1/>$field</font></td>\n";
print "</tr>\n";
}
print "</table>\n";
$result->free();
$link->close();
?>
</body>
</html> 

