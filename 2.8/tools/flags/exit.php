<?PHP
$filename = 'exit.txt';
@ $fp = fopen($filename, 'wb');
if (!$fp)
{
    echo '<p><strong>Cannot generate message file</strong></p></body></html>';
    exit;
} 
else
{
$outputstring  = 'Exit';
fwrite($fp, $outputstring);
Echo "";
}
$fp = fclose($filename );
$file = "exit.txt";
if (!unlink($file))
  {
  echo ("Error deleting $file");
  }
else
  {
  echo ("Success");
  }
?>