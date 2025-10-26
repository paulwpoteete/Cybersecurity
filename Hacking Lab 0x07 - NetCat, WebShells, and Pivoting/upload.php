<!-- Created by Dr. Poteete for Cybersecurity at Geneva College -->
<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
	$uploadDir = './';
	$targetFile = $uploadDir . basename($_FILES["file"]["name"]);
	
	
	if (move_uploaded_file($_FILES["file"]["tmp_name"], $targetFile)) {
		$message = "File Uploaded Successfully: " . basename($_FILES["file"]["name"]);
	} else {
		$error = "There was some error. Maybe permissions?";
	}
}
?>


<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
</head>
<body>
<?php if (isset($message)) : ?>
<p><?php echo "<center><h2>$message</h2><hr></center>"; ?></p>
<?php endif; ?>


<?php if (isset($error)) : ?>
<p><?php echo $error; ?></p>
<?php endif; ?>
<center>
<p><strong>Upload Here</strong></p>
<hr>

<form method="post" enctype="multipart/form-data">
<label for="file">Choose a file:</label>
<input type="file" name="file" id="file">
<input type="submit" value="Upload">
</form>
</body>
</html>
