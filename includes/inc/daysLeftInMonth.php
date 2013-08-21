<?php
/**
 * Created by JetBrains PhpStorm.
 * Project: Members.Geekdom
 * User: Carl "Tex" Morgan
 * Date: 7/17/13
 * Time: 11:37 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
/**
 * Class daysLeftInMonth
 */
class daysLeftInMonth {

    protected $lastDay;
    protected $today;
    protected $diffDays;

    public static $daysLeftInMonth;
    
    protected function __construct()
    {
            $this->today=new DateTime("now");
    }

    public static function instance()
    {
        if(!isset(self::$daysLeftInMonth)){
            self::$daysLeftInMonth = new daysLeftInMonth(); 
        }
        return self::$daysLeftInMonth;
    }

    public function execute()
    {
        $this->setLastDay();
        $this->setDiff();
        return $this->diffDays->format('%a');
    }

    protected function setLastDay()
    {
        $this->lastDay = DateTime::createFromFormat('Y-m-d', date('Y-m-t'));

    }

    protected function setDiff(){
        $this->diffDays= $this->today->diff($this->lastDay,true);
    }
}
/*
$daysLeft=daysLeftInMonth::instance();
$daysLeft->execute();
*/