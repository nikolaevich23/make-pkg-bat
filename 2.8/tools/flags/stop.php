<?PHP
$filename = 'stop.txt';
@ $fp = fopen($filename, 'wb');
if (!$fp)
{
    echo '<p><strong>Cannot generate message file</strong></p></body></html>';
    exit;
} 
else
{
$outputstring  = 'stop';
fwrite($fp, $outputstring);
Echo "";
}
$fp = fclose($filename );
$file = "stop.txt";
if (!unlink($file))
  {
  echo ("Error deleting $file");
  }
else
  {
  echo ("Success");
  }
?>