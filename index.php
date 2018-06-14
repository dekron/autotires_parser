<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Parser Index</title>
</head>
<body>
<?php

final class Index
{
    public function init()
    {
        spl_autoload_register(array($this, 'loadClass'));
    }

    public function loadClass($name)
    {
        $classes = array(
            'ParserInterface' => 'model/ParserInterface.php',
            'Parser' => 'model/Parser.php',
            'MysqlInterface' => 'model/MysqlInterface.php',
            'Mysql' => 'model/Mysql.php',
        );
        if (!array_key_exists($name, $classes)) {
            die('Class "' . $name . '" not found.');
        }
        require_once $classes[$name];
    }

    public function run()
    {
        //инициализируем базу
        $databaseHost = 'localhost';
        $databaseName = 'test_parser';
        $databaseUsername = 'root';
        $databasePassword = '123';
        $db = new Mysql($databaseHost, $databaseUsername, $databasePassword, $databaseName);

        //объект парсера
        $parser = new Parser();

        //достаем все товары которые нераспознаны
        $products = $db->getQueryResult("SELECT * FROM products WHERE NOT EXISTS (SELECT 1 FROM params WHERE products.id = params.product_id);");
        foreach ($products as $key => $value) {
            $product_str = $value['name'];

            //парсим строку извлекаем параметры
            $paramsMatch = $parser->matchParams($product_str);
            //если параметры есть и соответствуют то кидаем в таблицу параметров
            // если нет то вписываем флаг ошибки
            if ($paramsMatch) {
                $query = "INSERT INTO params (id, product_id, brand, model, width, height, construction, diameter, load_index, speed_index, char_abbr, runflat, intimate, season)
                              VALUES (NULL, '{$value['id']}', '{$paramsMatch[1]}', '{$paramsMatch[2]}', {$paramsMatch[3]}, {$paramsMatch[4]}, '{$paramsMatch[5]}', {$paramsMatch[6]}, {$paramsMatch[7]}, '{$paramsMatch[8]}', '{$paramsMatch[9]}', '{$paramsMatch[10]}', '{$paramsMatch[11]}', '{$paramsMatch[12]}');";
                $db->query($query);
                echo 'Распарсили строку:';
                echo '<br>';
                echo $value['name'];
                echo '<br>';
                echo '<br>';

            } else {
                $query = "UPDATE products SET error_recognized = 1 WHERE id = '{$value['id']}';";
                $db->query($query);
                echo 'Ошибка в строке:';
                echo '<br>';
                echo $value['name'];
                echo '<br>';
                echo '<br>';
            }
        }
    }
}

$index = new Index();
$index->init();
$index->run();
?>
</body>
</html>