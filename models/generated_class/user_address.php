<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: User_Address
******************/
class User_AddressModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    protected $id;
    public $user_id;
    public $address;
    public $address2;
    public $city;
    public $state;
    public $zip;
    public $longitude;
    public $latitude;
    public $status;
    public $create_date;
    public $modify_date;
    public $modify_user;
    public $modify_reason;
    static protected $acceptableKeys = array("id", "user_id", "address", "address2", "city", "state", "zip", "longitude", "latitude", "status", "create_date", "modify_date", "modify_user", "modify_reason");


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
                case 'user_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->user_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'address' :
                    if($this->checkValue("varchar(128)",128,$value)){
                        $this->address=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'address2' :
                    if($this->checkValue("varchar(128)",128,$value)){
                        $this->address2=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'city' :
                    if($this->checkValue("varchar(128)",128,$value)){
                        $this->city=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'state' :
                    if($this->checkValue("char(2)",2,$value)){
                        $this->state=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'zip' :
                    if($this->checkValue("varchar(5)",5,$value)){
                        $this->zip=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'longitude' :
                    if($this->checkValue("float(16,14)",2,$value)){
                        $this->longitude=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'latitude' :
                    if($this->checkValue("float(16,14)",2,$value)){
                        $this->latitude=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'status' :
                    if($this->checkValue("enum('pending','enabled','disabled','retired')",4,$value)){
                        $this->status=$value;
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
                case 'modify_user' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->modify_user=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'modify_reason' :
                    if($this->checkValue("varchar(128)",128,$value)){
                        $this->modify_reason=$value;
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
                    case "varchar(128)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "char(2)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "varchar(5)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "float(16,14)":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "enum('pending','enabled','disabled','retired')":
                        if (  in_array($value,array( 'pending' , 'enabled' , 'disabled' , 'retired' ))  ) {
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
    	           if ( $this->query->execute("CALL getUser_Address('$id')") ) {
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
                    if ( $this->query->execute("CALL updateUser_Address(
                        '$this->id'
                        ,'$this->user_id'
                        ,'$this->address'
                        ,'$this->address2'
                        ,'$this->city'
                        ,'$this->state'
                        ,'$this->zip'
                        ,'$this->longitude'
                        ,'$this->latitude'
                        ,'$this->status'
                        ,'$this->create_date'
                        ,'$this->modify_date'
                        ,'$this->modify_user'
                        ,'$this->modify_reason'
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
                    if ( $this->query->execute("CALL insertUser_Address(
                        '$this->user_id'
                        ,'$this->address'
                        ,'$this->city'
                        ,'$this->state'
                        ,'$this->zip'
                        ,'$this->status'
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
                if ( $this->query->execute("CALL validateUser_Address('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->user_id','$this->address','$this->city','$this->state','$this->zip','$this->status','$this->create_date'))) {
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
