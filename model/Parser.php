<?php
/**
 * Created by PhpStorm.
 * User: dmitry
 * Date: 14.06.2018
 * Time: 10:45
 */
class Parser implements ParserInterface{
    protected $carModels = ['Nokian', 'BFGoodrich', 'Pirelli', 'Toyo', 'Continental', 'Hankook', 'Mitas'];
    protected $runFlat = ['RunFlat', 'Run Flat', 'ROF', 'ZP', 'SSR', 'ZPS', 'HRS', 'RFT'];
    protected $camernost = ['TT', 'TL', 'TL/TT'];
    protected $season = ['Зимние (шипованные)', 'Внедорожные', 'Летние', 'Зимние (нешипованные)', 'Всесезонные'];

    function __construct() {
    }

    public function matchParams($str) {
        ////////////////////////(Бренд***************************)////(Мд)/(ширина**)\/(Высота**)(Констр)(Диаметр*)/(индекс нгр)(индк скр)   (хар абреви)   (Runflat************************)    (Камерн*********************************************************)    (сезон*******************************************************)
        if(preg_match('/('.join("|",$this->carModels).') (.+) ([0-9]{3})\/([0-9]{2})([R]{1})([0-9]{2}) ([0-9]{1,3})([A-Z]{1})\s?([A-Z]{0,4})\s?('.join("|",$this->runFlat).')?\s?('.addcslashes(join("|",$this->camernost),'/').')?\s?('.addcslashes(join("|",$this->season),'/()').')/', $str, $matches)){
            return $matches;
        }
        return false;
    }
}