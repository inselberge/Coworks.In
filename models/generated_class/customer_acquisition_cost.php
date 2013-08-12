<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: Customer_Acquisition_CostModel
******************/
class Customer_Acquisition_CostModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    private $id;
    protected $coworking_space_id;
    protected $marketing_spend;
    protected $spend_per_signup_blended;
    protected $spend_per_signup_paid;
    protected $sales_spend;
    protected $sales_spend_per_new_paying_customer;
    protected $total_customer_acquisition_cost_blended;
    protected $total_customer_acquisition_cost_paid;
    protected $time_to_recover_cac_in_months;
    protected $customer_lifetime_value;
    protected $customer_lifetime_value_acquisition_cost_multiple;
    protected $create_date;
    protected $modify_date;
    static public $Customer_Acquisition_CostModel;
    static protected $acceptableKeys = array("id", "coworking_space_id", "marketing_spend", "spend_per_signup_blended", "spend_per_signup_paid", "sales_spend", "sales_spend_per_new_paying_customer", "total_customer_acquisition_cost_blended", "total_customer_acquisition_cost_paid", "time_to_recover_cac_in_months", "customer_lifetime_value", "customer_lifetime_value_acquisition_cost_multiple", "create_date", "modify_date");


    /** instance
     * @param $dbc
     * @return mixed
    */
    static public function instance($dbc) {
        if(!isset(self::$Customer_Acquisition_CostModel) ) {
            self::$Customer_Acquisition_CostModel = new Customer_Acquisition_CostModel($dbc);
        } else {
            self::$Customer_Acquisition_CostModel->connection = $dbc;
        }
        return self::$Customer_Acquisition_CostModel;
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
                case 'marketing_spend' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->marketing_spend=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'spend_per_signup_blended' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->spend_per_signup_blended=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'spend_per_signup_paid' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->spend_per_signup_paid=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'sales_spend' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->sales_spend=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'sales_spend_per_new_paying_customer' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->sales_spend_per_new_paying_customer=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_customer_acquisition_cost_blended' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->total_customer_acquisition_cost_blended=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_customer_acquisition_cost_paid' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->total_customer_acquisition_cost_paid=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'time_to_recover_cac_in_months' :
                    if($this->checkValue("float",NULL,$value)){
                        $this->time_to_recover_cac_in_months=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'customer_lifetime_value' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->customer_lifetime_value=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'customer_lifetime_value_acquisition_cost_multiple' :
                    if($this->checkValue("float unsigned",NULL,$value)){
                        $this->customer_lifetime_value_acquisition_cost_multiple=$value;
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
                    case "float unsigned":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  AND $value >=0  ) {
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
    	           if ( $this->query->execute("CALL getCustomer_Acquisition_Cost('$id')") ) {
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
                    if ( $this->query->execute("CALL updateCustomer_Acquisition_Cost(
                        '$this->id'
                        ,'$this->coworking_space_id'
                        ,'$this->marketing_spend'
                        ,'$this->spend_per_signup_blended'
                        ,'$this->spend_per_signup_paid'
                        ,'$this->sales_spend'
                        ,'$this->sales_spend_per_new_paying_customer'
                        ,'$this->total_customer_acquisition_cost_blended'
                        ,'$this->total_customer_acquisition_cost_paid'
                        ,'$this->time_to_recover_cac_in_months'
                        ,'$this->customer_lifetime_value'
                        ,'$this->customer_lifetime_value_acquisition_cost_multiple'
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
                    if ( $this->query->execute("CALL insertCustomer_Acquisition_Cost(
                        '$this->coworking_space_id'
                        ,'$this->marketing_spend'
                        ,'$this->spend_per_signup_blended'
                        ,'$this->spend_per_signup_paid'
                        ,'$this->sales_spend'
                        ,'$this->sales_spend_per_new_paying_customer'
                        ,'$this->total_customer_acquisition_cost_blended'
                        ,'$this->total_customer_acquisition_cost_paid'
                        ,'$this->time_to_recover_cac_in_months'
                        ,'$this->customer_lifetime_value'
                        ,'$this->customer_lifetime_value_acquisition_cost_multiple'
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
                if ( $this->query->execute("CALL validateCustomer_Acquisition_Cost('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->coworking_space_id','$this->marketing_spend','$this->spend_per_signup_blended','$this->spend_per_signup_paid','$this->sales_spend','$this->sales_spend_per_new_paying_customer','$this->total_customer_acquisition_cost_blended','$this->total_customer_acquisition_cost_paid','$this->time_to_recover_cac_in_months','$this->customer_lifetime_value','$this->customer_lifetime_value_acquisition_cost_multiple','$this->create_date','$this->modify_date'))) {
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
