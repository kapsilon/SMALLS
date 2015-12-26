<?
//Входные параметры
$file_name = 'DetectiveConan.txt';
$lines = file($file_name);
$min_lines =  array();
$new_file_name = 'new'.$file_name;
$arc_begin_chapters = array(176, 238, 435, 499, 622);
//Покажем список
foreach ($lines as $num => $line) {
    echo "$line<br/>\n";
}
//Уберём лишнее
foreach ($lines as $num => $line)
  {
  $line = rtrim($line);
  if (strlen($line) > 7)
    {
    $min_lines[$num] = substr($line, 6, 3).'-'.substr($line, -3, 3);
    }
  else
    {
    $min_lines[$num] = $line;
    }
  }
//Покажем список снова
foreach ($min_lines as $num => $line) {
    echo "$line<br/>\n";
  }
//Запишем в файл

$new_file = fopen($new_file_name, "w");
foreach ($min_lines as $num => $line)
  {
    //Разделим арки
    foreach ($arc_begin_chapters as $k => $v)
    {
      if ((integer)substr($line, 0, 3) == $v)
      {
        fwrite($new_file, "\r\n");
        echo $v;
      }
    }
  fwrite($new_file, $line."\r\n");
  }
fclose($new_file);
?>
