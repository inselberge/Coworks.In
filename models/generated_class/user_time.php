<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: User_Time
******************/
class User_TimeModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    protected $id;
    public $giving_user_id;
    public $taking_user_id;
    public $help_id;
    public $start_time;
    public $end_time;
    public $total_time;
    static protected $acceptableKeys = array("id", "giving_user_id", "taking_user_id", "help_id", "start_time", "end_time", "total_time");


    /**setValue
     * @param $key
     * @param $value
     * @return boolean
    */
    public function setValue($key,$value) {
        if(isset($key,$value) AND !is_null($key)){
            switch($key){
                case 'id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'giving_user_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->giving_user_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'taking_user_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->taking_user_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'help_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->help_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'start_time' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->start_time=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'end_time' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->end_time=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_time' :
                    if($this->checkValue("time",NULL,$value)){
                        $this->total_time=$value;
                    } else {
                        return false;
                    };
                    break;
            default:break;
            }
            return true;
        } else {
            return false;
        }
    }

    /** checkValue
    * @param string  $type  specifies the data type fully
    * @param integer $max   specifies the maximum
    * @param mixed   $value specifies the variable candidate
    * @return bool
    */
    public function checkValue( $type, $max, $value )
    {
        try {
            if ( checkInput::checkNewInputArray(array($type, $max, $value)) ) {
                switch ( $type ) {
                    case "int(10) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "timestamp":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "time":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    default:
                        return false;
                        break;
                }
            } else {
                throw new exceptionHandler(__METHOD__.": All required variables must be provided.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /**get
     * @param $id
     * @return boolean
    */
    public function get( $id ) {
        try {
            if ( checkInput::checkNewInput($id) ) {
    	           if ( $this->query->execute("CALL getUser_Time('$id')") ) {
    	               $this->query->getRow();
    	               $this->setValuesFromRow();
    	           } else {
    	               throw new exceptionHandler (__METHOD__.": The get query returned an error.");
    	           }
    	       }
    	    } catch ( exceptionHandler $e ) {
    	       $e->execute();
    	       return false;
    	    }
    	    return true;
    }

    /** update
     * @return bool
    */
    public function update()
    {
        try {
            if ( $this->checkRequired() ) {
                if ( $this->prewash() ) {
                    if ( $this->query->execute("CALL updateUser_Time(
                        '$this->id'
                        ,'$this->giving_user_id'
                        ,'$this->taking_user_id'
                        ,'$this->help_id'
                        ,'$this->start_time'
                        ,'$this->end_time'
                        ,'$this->total_time'
                            )")
                    ) {
                    $this->query->checkAffected();
                    } else {
                        throw new exceptionHandler(__METHOD__ . ": The update query returned an error.");
                    }
                }
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** insert
    * @return bool
    */
    public function insert()
    {
        try {
            if ( $this->checkRequired()) {
                if ( $this->prewash() ) {
                    if ( $this->query->execute("CALL insertUser_Time(
                        '$this->giving_user_id'
                        ,'$this->taking_user_id'
                        ,'$this->start_time'
                            , @ceid)")
                    ) {
                        $this->getInsertId();
                    } else {
                        throw new exceptionHandler(__METHOD__.": The insert failed.");
                    }
                }
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** getInsertId
    * @return bool
    */
    public function getInsertId()
    {
        try {
            if ( $this->query->execute("Select @ceid as id") ) {
                $this->query->getRow();
                if ( !$this->setValue("id", $this->query->row["id"]) ) {
                    throw new exceptionHandler(__METHOD__ . ": Setting the new id failed.");
                }
            } else {
                throw new exceptionHandler(__METHOD__ . ": The new id could not be retrieved.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** validate
    * @param integer $id unsigned integer reference to the table primary key
    * @return bool
    */
    public function validate( $id )
    {
        try {
            if ( checkInput::checkNewInput($id) ) {
                if ( $this->query->execute("CALL validateUser_Time('$id')") ) {
                    $this->query->checkAffected();
                } else {
                    throw new exceptionHandler(__METHOD__.": Validation sproc error!");
                }
            } else {
                throw new exceptionHandler(__METHOD__.": The id must be set.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** checkRequired
    * @return bool
    */
    protected function checkRequired()
    {
        try {
            if (checkInput::checkNewInputArray(array('$this->giving_user_id','$this->taking_user_id','$this->start_time'))) {
            } else {
                throw new exceptionHandler (__METHOD__ . ": Required values are not all specified.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }
}
