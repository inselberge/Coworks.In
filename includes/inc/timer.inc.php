<?php

/**
 *
 */
class timer {

	public $startTime;
	public $endTime;
	public $diffTime;

    /**
     *
     */
    public function __construct(){
		$this->set('start');
	}

    /**
     * @param $name
     * @return bool
     */
    public function set($name){
			if(isset($name) AND !is_null($name)){
				switch($name){
						case 'start'	: $this->startTime=time();break;
						case 'end'	: $this->endTime=time();$this->set('diff');break;
						case 'diff' 	: if(isset($this->startTime,$this->endTime)){$this->diffTime=$this->endTime - $this->startTime;}else{return FALSE;};break;
						default		: return FALSE;break;
				}
			}
			else{
					//throw Error
					return FALSE;
			}
	}

    /**
     * @param $name
     * @return bool
     */
    public function get($name){
			if(isset($name) AND !is_null($name)){
				switch($name){
						case 'start'	: return $this->startTime;break;
						case 'end'	: return $this->endTime;break;
						case 'diff' 	: return $this->diffTime;break;
						default		: return FALSE;break;
				}
			}
			else{
					//throw Error
					return FALSE;
			}		
	}

    /**
     * @param $dbc
     * @param $page
     * @param $label
     * @param $user
     * @return bool
     */
    public function insert($dbc, $page, $label, $user){
		if(isset($dbc, $page, $label, $user)){
			$q="Call insertTimer`('$page', '$label', '$user', '$this->diffTime', @ceid)";
			$result=mysqli_query($dbc,$q);
			if(mysqli_affected_rows($dbc)==1){
				return TRUE;
			}
			else{
				//throw new exceptionHandler(__METHOD__.":Failed query for insert of Timer.");
				return FALSE;
			}
		}
		else{
				//throw new exceptionHandler(__METHOD__.":Missing required values for insert of Timer.");
				return FALSE;
		}
	}

}