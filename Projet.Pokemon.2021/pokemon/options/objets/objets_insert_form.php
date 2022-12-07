<html><head><title>Objet Insert Form</title><link rel="stylesheet" href="../styles.css"></head>
<body>
<table width="300" cellpadding="5" cellspacing="0" border="2">
<tr align="center" valign="top">

<h3>Entrez un Objet</h3>
<table summary="Liste Objet" class="table table-bordered table-hover">
<form method="POST" action="objets_insert_record.php">
<!--The hidden fields are provided to maintain state.  They are used to pass the username and password from script to script.-->
<input type="hidden" name="username" value="<?php print $_POST['username']?>">
<input type="hidden" name="password" value="<?php print $_POST['password']?>">

<tr><td >Entrez un objet :</td><td><input type=text name=NomObjet></td></tr>
<tr><td >Entrez la specificite :</td><td><input type=text name=NomSpecificite></td></tr>

</select>
<tr><td ><label><input type=submit value="Entrer"><input type=reset></td></tr>
</table>
</form>
</td></tr></table>
</body>
</html>
