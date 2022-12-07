<html><head><title>Dresseur Insert Form</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">

<h3>Entrez un Dresseur</h3>
<table summary="Liste Dresseur" class="table table-bordered table-hover">
<form method="POST" action="dresseurs_insert_record.php">
<!--The hidden fields are provided to maintain state.  They are used to pass the username and password from script to script.-->
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">

<tr><td >Entrez un nom :</td><td><input type=text name=NomDresseur></td></tr>
<tr><td >Entrez la prenom :</td><td><input type=text name=PrenomDresseur></td></tr>

</select>
<tr><td ><label><input type=submit value="Entrer"><input type=reset></td></tr>
</table>
</form>
</td></tr></table>
</body>
</html>
