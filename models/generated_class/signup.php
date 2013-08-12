<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: SignupModel
******************/
class SignupModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    private $id;
    protected $coworking_space_id;
    protected $last_month_visitors;
    protected $current_visitors;
    protected $growth_of_visitors;
    protected $start_of_month_signups;
    protected $referral_signups;
    protected $walk_in_signups;
    protected $paid_signups;
    protected $total_new_signups;
    protected $last_month_signups;
    protected $growth_of_signups;
    protected $conversion_rate;
    protected $total_referrals;
    protected $referral_conversion_rate;
    protected $end_of_month_signups;
    protected $create_date;
    protected $modify_date;
    static public $SignupModel;
    static protected $acceptableKeys = array("id", "coworking_space_id", "last_month_visitors", "current_visitors", "growth_of_visitors", "start_of_month_signups", "referral_signups", "walk_in_signups", "paid_signups", "total_new_signups", "last_month_signups", "growth_of_signups", "conversion_rate", "total_referrals", "referral_conversion_rate", "end_of_month_signups", "create_date", "modify_date");


    /** instance
     * @param $dbc
     * @return mixed
    */
    static public function instance($dbc) {
        if(!isset(self::$SignupModel) ) {
            self::$SignupModel = new SignupModel($dbc);
        } else {
            self::$SignupModel->connection = $dbc;
        }
        return self::$SignupModel;
    }

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
                case 'last_month_visitors' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->last_month_visitors=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'current_visitors' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->current_visitors=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'growth_of_visitors' :
                    if($this->checkValue("double",NULL,$value)){
                        $this->growth_of_visitors=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'start_of_month_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->start_of_month_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'referral_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->referral_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'walk_in_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->walk_in_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'paid_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->paid_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_new_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->total_new_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'last_month_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->last_month_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'growth_of_signups' :
                    if($this->checkValue("double",NULL,$value)){
                        $this->growth_of_signups=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'conversion_rate' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->conversion_rate=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_referrals' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->total_referrals=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'referral_conversion_rate' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->referral_conversion_rate=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'end_of_month_signups' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->end_of_month_signups=$value;
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
                    case "double":
                        if (  is_double(doubleval($value)) ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "float unsigned":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  AND $value >=0  ) {
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
    	           if ( $this->query->execute("CALL getSignup('$id')") ) {
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
                    if ( $this->query->execute("CALL updateSignup(
                        '$this->id'
                        ,'$this->coworking_space_id'
                        ,'$this->last_month_visitors'
                        ,'$this->current_visitors'
                        ,'$this->growth_of_visitors'
                        ,'$this->start_of_month_signups'
                        ,'$this->referral_signups'
                        ,'$this->walk_in_signups'
                        ,'$this->paid_signups'
                        ,'$this->total_new_signups'
                        ,'$this->last_month_signups'
                        ,'$this->growth_of_signups'
                        ,'$this->conversion_rate'
                        ,'$this->total_referrals'
                        ,'$this->referral_conversion_rate'
                        ,'$this->end_of_month_signups'
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
                    if ( $this->query->execute("CALL insertSignup(
                        '$this->coworking_space_id'
                        ,'$this->last_month_visitors'
                        ,'$this->current_visitors'
                        ,'$this->growth_of_visitors'
                        ,'$this->start_of_month_signups'
                        ,'$this->referral_signups'
                        ,'$this->walk_in_signups'
                        ,'$this->paid_signups'
                        ,'$this->total_new_signups'
                        ,'$this->last_month_signups'
                        ,'$this->growth_of_signups'
                        ,'$this->conversion_rate'
                        ,'$this->total_referrals'
                        ,'$this->referral_conversion_rate'
                        ,'$this->end_of_month_signups'
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
                if ( $this->query->execute("CALL validateSignup('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->coworking_space_id','$this->last_month_visitors','$this->current_visitors','$this->growth_of_visitors','$this->start_of_month_signups','$this->referral_signups','$this->walk_in_signups','$this->paid_signups','$this->total_new_signups','$this->last_month_signups','$this->growth_of_signups','$this->conversion_rate','$this->total_referrals','$this->referral_conversion_rate','$this->end_of_month_signups','$this->create_date','$this->modify_date'))) {
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
