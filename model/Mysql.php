<?php

class Mysql implements MysqlInterface
{
    protected $db = null;

    function __construct($databaseHost, $databaseUsername = '', $databasePassword = '', $databaseName = '') {
        $this->db = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);
        $this->query("SET NAMES 'utf8'");
        $this->query("SET CHARACTER SET utf8");
        $this->query("SET SESSION collation_connection = 'utf8_unicode_ci'");
    }

    public function query($query)
    {
        return $this->db->query($query);
    }

    public function getQueryResult($query)
    {
        $data = null;
        $query = $this->query($query);
        while($res = mysqli_fetch_array($query)) {
            $data[] = $res;
        }

        return $data;
    }
}