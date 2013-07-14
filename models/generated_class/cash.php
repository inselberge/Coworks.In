<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: Cash
******************/
class CashModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    protected $id;
    public $coworking_space_id;
    public $start_of_month_cash;
    public $incoming_cash;
    public $outgoing_cash;
    public $net_cash_burn;
    public $end_of_month_cash;
    public $runaway;
    public $create_date;
    public $modify_date;
    static protected $acceptableKeys = array("id", "coworking_space_id", "start_of_month_cash", "incoming_cash", "outgoing_cash", "net_cash_burn", "end_of_month_cash", "runaway", "create_date", "modify_date");


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
                case 'coworking_space_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->coworking_space_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'start_of_month_cash' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->start_of_month_cash=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'incoming_cash' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->incoming_cash=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'outgoing_cash' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->outgoing_cash=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'net_cash_burn' :
                    if($this->checkValue("double",NULL,$value)){
                        $this->net_cash_burn=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'end_of_month_cash' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->end_of_month_cash=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'runaway' :
                    if($this->checkValue("float",NULL,$value)){
                        $this->runaway=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'create_date' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->create_date=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'modify_date' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->modify_date=$value;
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
                    case "double unsigned":
                        if (  is_double(doubleval($value)) AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "double":
                        if (  is_double(doubleval($value)) ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "float":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  ) {
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
    	           if ( $this->query->execute("CALL getCash('$id')") ) {
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
                    if ( $this->query->execute("CALL updateCash(
                        '$this->id'
                        ,'$this->coworking_space_id'
                        ,'$this->start_of_month_cash'
                        ,'$this->incoming_cash'
                        ,'$this->outgoing_cash'
                        ,'$this->net_cash_burn'
                        ,'$this->end_of_month_cash'
                        ,'$this->runaway'
                        ,'$this->create_date'
                        ,'$this->modify_date'
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
                    if ( $this->query->execute("CALL insertCash(
                        '$this->coworking_space_id'
                        ,'$this->start_of_month_cash'
                        ,'$this->incoming_cash'
                        ,'$this->outgoing_cash'
                        ,'$this->net_cash_burn'
                        ,'$this->end_of_month_cash'
                        ,'$this->runaway'
                        ,'$this->modify_date'
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
                if ( $this->query->execute("CALL validateCash('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->coworking_space_id','$this->start_of_month_cash','$this->incoming_cash','$this->outgoing_cash','$this->net_cash_burn','$this->end_of_month_cash','$this->runaway','$this->create_date','$this->modify_date'))) {
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
