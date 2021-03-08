<?php
$inicio =  htmlspecialchars($_POST['inicio']);
$fim = htmlspecialchars($_POST['fim']);
$url =  htmlspecialchars($_POST['url']);
$output = shell_exec("bash /home/scripts/download-and-cut.sh '" . $inicio . "'  '" . $fim . "'    '" . $url . "' ");

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <a href="./video.mp4" download="video.mp4">
    DOWNLOAD
    </a>
</body>

</html>