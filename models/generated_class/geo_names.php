<?php 
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/******************
Class: Geo_Names
******************/
class Geo_NamesModel extends basicModel implements concreteModelInterface {
    /*** Attributes: ***/
    protected $id;
    public $country code;
    public $postal_code;
    public $place_name;
    public $state_name;
    public $state_code;
    public $county_name;
    public $county_code;
    public $community_name;
    public $community_code;
    public $latitude;
    public $longitude;
    public $accuracy;
    public $status;
    public $modify_date;
    public $modify_user;
    public $modify_reason;
    static protected $acceptableKeys = array("id", "country code", "postal_code", "place_name", "state_name", "state_code", "county_name", "county_code", "community_name", "community_code", "latitude", "longitude", "accuracy", "status", "modify_date", "modify_user", "modify_reason");


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
                case 'country code' :
                    if($this->checkValue("char(2)",2,$value)){
                        $this->country code=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'postal_code' :
                    if($this->checkValue("varchar(20)",20,$value)){
                        $this->postal_code=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'place_name' :
                    if($this->checkValue("varchar(180)",180,$value)){
                        $this->place_name=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'state_name' :
                    if($this->checkValue("varchar(100)",100,$value)){
                        $this->state_name=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'state_code' :
                    if($this->checkValue("varchar(20)",20,$value)){
                        $this->state_code=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'county_name' :
                    if($this->checkValue("varchar(100)",100,$value)){
                        $this->county_name=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'county_code' :
                    if($this->checkValue("varchar(20)",20,$value)){
                        $this->county_code=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'community_name' :
                    if($this->checkValue("varchar(100)",100,$value)){
                        $this->community_name=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'community_code' :
                    if($this->checkValue("varchar(20)",20,$value)){
                        $this->community_code=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'latitude' :
                    if($this->checkValue("float(6,4)",2,$value)){
                        $this->latitude=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'longitude' :
                    if($this->checkValue("float(6,4)",2,$value)){
                        $this->longitude=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'accuracy' :
                    if($this->checkValue("tinyint(3) unsigned",3,$value)){
                        $this->accuracy=$value;
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
                    if($this->checkValue("varchar(100)",100,$value)){
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
                    case "char(2)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "varchar(20)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "varchar(180)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "varchar(100)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "float(6,4)":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "tinyint(3) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
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
    	           if ( $this->query->execute("CALL getGeo_Names('$id')") ) {
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
                    if ( $this->query->execute("CALL updateGeo_Names(
                        '$this->id'
                        ,'$this->country code'
                        ,'$this->postal_code'
                        ,'$this->place_name'
                        ,'$this->state_name'
                        ,'$this->state_code'
                        ,'$this->county_name'
                        ,'$this->county_code'
                        ,'$this->community_name'
                        ,'$this->community_code'
                        ,'$this->latitude'
                        ,'$this->longitude'
                        ,'$this->accuracy'
                        ,'$this->status'
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
                    if ( $this->query->execute("CALL insertGeo_Names(
                        '$this->country code'
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
                if ( $this->query->execute("CALL validateGeo_Names('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->country code','$this->status'))) {
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
