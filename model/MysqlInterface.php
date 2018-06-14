<?php
/**
 * Created by PhpStorm.
 * User: dmitry
 * Date: 14.06.2018
 * Time: 10:55
 */

interface MysqlInterface
{
    public function query($query);
    public function getQueryResult($query);
}