<?php
/**
 * Created by JetBrains PhpStorm.
 * Project: Members.Geekdom
 * User: Carl "Tex" Morgan
 * Date: 7/17/13
 * Time: 5:35 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
require_once CORE_CLASS."basicInteraction.php";
require_once CORE_CLASS."databaseQueryMySQLi.php";
/**
 * Class tracker
 */
class tracker extends basicInteraction{

    protected $query;
    protected $coworking_space_id;
    protected $session_id;
    protected $ip;
    protected $isMember;
    protected $userID;
    public static $tracker;

    public static function instance($dbc)
    {
        if(!isset(self::$tracker)){
            self::$tracker = new tracker($dbc);
        }
        return self::$tracker;
    }

    protected function setFromServer()
    {
        if(isset($_SERVER["REMOTE_ADDR"]) AND !is_null($_SERVER["REMOTE_ADDR"]))
        {
            $this->ip=$_SERVER["REMOTE_ADDR"];
        } else {
            $this->ip=false;
        }
        if(isset($_SERVER["HTTP_COOKIE"]) AND !is_null($_SERVER["HTTP_COOKIE"]))
        {
            $this->session_id=$_SERVER["HTTP_COOKIE"];
        } else {
            $this->session_id=false;
        }

    }

    protected function setFromSession()
    {
        if(isset($_SESSION["coworking_space_id"]) AND !is_null($_SESSION["coworking_space_id"]))
        {
            $this->coworking_space_id=$_SESSION["coworking_space_id"];
        } else {
            $this->coworking_space_id=false;
        }
        if(isset($_SESSION["user_id"]) AND !is_null($_SESSION["user_id"]))
        {
            $this->user_id=$_SESSION["user_id"];
            $this->isMember=1;
        } else {
            $this->user_id=0;
            $this->isMember=0;
        }
    }

    public function execute()
    {
        $this->setFromServer();
        $this->setFromSession();
        $this->query= databaseQueryMySQLi::instance($this->connection);

        $this->query->execute("CALL insertSession('$this->coworking_space_id','$this->session_id','$this->ip','$this->isMember','$this->user_id');");
    }

}