<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: Paying_Customers
******************/
class Paying_CustomersModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    protected $id;
    public $coworking_space_id;
    public $start_of_month_customers;
    public $new_customers;
    public $conversion_rate;
    public $lost_customers;
    public $churn_rate;
    public $net_new_customers;
    public $end_of_month_customers;
    public $growth_customers;
    public $create_date;
    public $modify_date;
    static protected $acceptableKeys = array("id", "coworking_space_id", "start_of_month_customers", "new_customers", "conversion_rate", "lost_customers", "churn_rate", "net_new_customers", "end_of_month_customers", "growth_customers", "create_date", "modify_date");


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
                case 'start_of_month_customers' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->start_of_month_customers=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'new_customers' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->new_customers=$value;
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
                case 'lost_customers' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->lost_customers=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'churn_rate' :
                    if($this->checkValue("double",NULL,$value)){
                        $this->churn_rate=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'net_new_customers' :
                    if($this->checkValue("int(11)",11,$value)){
                        $this->net_new_customers=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'end_of_month_customers' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->end_of_month_customers=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'growth_customers' :
                    if($this->checkValue("double",NULL,$value)){
                        $this->growth_customers=$value;
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
                    case "float unsigned":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  AND $value >=0  ) {
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
                    case "int(11)":
                        if (  is_int($value) AND $max >= strlen($value)  ) {
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
    	           if ( $this->query->execute("CALL getPaying_Customers('$id')") ) {
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
                    if ( $this->query->execute("CALL updatePaying_Customers(
                        '$this->id'
                        ,'$this->coworking_space_id'
                        ,'$this->start_of_month_customers'
                        ,'$this->new_customers'
                        ,'$this->conversion_rate'
                        ,'$this->lost_customers'
                        ,'$this->churn_rate'
                        ,'$this->net_new_customers'
                        ,'$this->end_of_month_customers'
                        ,'$this->growth_customers'
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
                    if ( $this->query->execute("CALL insertPaying_Customers(
                        '$this->coworking_space_id'
                        ,'$this->start_of_month_customers'
                        ,'$this->new_customers'
                        ,'$this->conversion_rate'
                        ,'$this->lost_customers'
                        ,'$this->churn_rate'
                        ,'$this->net_new_customers'
                        ,'$this->end_of_month_customers'
                        ,'$this->growth_customers'
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
                if ( $this->query->execute("CALL validatePaying_Customers('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->coworking_space_id','$this->start_of_month_customers','$this->new_customers','$this->conversion_rate','$this->lost_customers','$this->churn_rate','$this->net_new_customers','$this->end_of_month_customers','$this->growth_customers','$this->create_date','$this->modify_date'))) {
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
