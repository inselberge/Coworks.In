<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 3/5/13
 * Time: 3:01 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */

class json {

    private $payloadJSON;
    private $payloadPHP;

    public function __construct($raw,$phpOrJSON){
        try{
            if($phpOrJSON==1){
                $this->payloadPHP=$raw;
                $this->encode();
            }
            elseif($phpOrJSON==2){
                $this->payloadJSON = $raw;
                $this->decodeArray();
            }
            else{
                throw new Exception(utf8_encode("Invalid option for JSON conversion using the json PHP class."));
            }
        }
        catch(Exception $e){
            echo $e;
        }
    }

    public function decodeRaw(){
        try{
            $this->payloadPHP = json_decode($this->payloadJSON);
            if($this->payloadPHP == false){
                throw new Exception (utf8_encode("There was a problem decoding the JSON payload:".$this->error()));
            }
        }
        catch(Exception $e){
            echo $e;
        }
    }

    public function decodeArray(){
        try{
            $this->payloadPHP = json_decode($this->payloadJSON,true);
            if($this->payloadPHP == false){
                throw new Exception (utf8_encode("There was a problem decoding the JSON payload:".$this->error()));
            }
        }
        catch(Exception $e){
            echo $e;
        }
    }

    public function encode(){
        try{
            try{
                $this->payloadJSON = json_encode($this->payloadPHP);
                if($this->payloadPHP == false){
                    throw new Exception (utf8_encode("There was a problem encoding the JSON payload:".$this->error()));
                }
            }
            catch(Exception $e){
                echo $e;
            }
        }
        catch(Exception $e){
            echo $e;
        }
    }

    private function error(){
        switch (json_last_error()) {
            case JSON_ERROR_NONE:
                return ' No errors';
                break;
            case JSON_ERROR_DEPTH:
                return ' Maximum stack depth exceeded';
                break;
            case JSON_ERROR_STATE_MISMATCH:
                return ' Underflow or the modes mismatch';
                break;
            case JSON_ERROR_CTRL_CHAR:
                return ' Unexpected control character found';
                break;
            case JSON_ERROR_SYNTAX:
                return ' Syntax error, malformed JSON';
                break;
            case JSON_ERROR_UTF8:
                return ' Malformed UTF-8 characters, possibly incorrectly encoded';
                break;
            default:
                return ' Unknown error';
                break;
        }
    }

    public function printJSON(){
        print_r($this->payloadJSON);
    }

    public function printPHP(){
        print_r($this->payloadPHP);
    }
}