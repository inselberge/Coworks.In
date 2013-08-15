<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 2/11/13
 * Time: 5:33 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */

class dateConvert {
  public $original;
  public $originalFormat;
  public $convertedFormat;

  private $now;
  private $objectDateTime;
  private $converted;


  public function __construct($originalFormat,$dateRaw){
    try{
       $this->set('originalFormat',$originalFormat);
       $this->set('original',$dateRaw);
    }
    catch (Exception $e){
      echo $e;
    }
  }

  private function checkValue($val) {
    if(isset($val)){
      if(!is_null($val)){
        return TRUE;
      }
      else{
        return FALSE;
      }
    }
    else{
      throw new exceptionHandler(__METHOD__.": the value is not set");
    }
  }

  public function set ($key, $val){
    try{
      if($this->checkKey($key) AND $this->checkValue($val)){
        $this->$$key = $val;
      }
      else{
        throw new exceptionHandler(__METHOD__.": could not set $key to $val .");
      }
    }
    catch(Exception $e){
      echo $e;
    }
  }

  private function checkKey($key){
    if(isset($key)){
      if(!is_null($key)){
        try{
          return $this->checkMember($key);
        }
        catch (Exception $e){
          echo $e;
        }
      }
      else{
        return FALSE;
      }
    }
    else{
      throw new exceptionHandler(__METHOD__.": the key is not set");
    }
  }

  private function checkMember($key){
    if(property_exists(get_class(),$key)){
      return TRUE;
    }
    else{
      throw new exceptionHandler(__METHOD__.": the key is invalid");
    }
  }

  private function create(){
    $this->objectDateTime = DateTime::createFromFormat($this->type, $this->original);
  }

  private function createNow(){
    $this->now = new DateTime();
  }

  private function checkFuture(){
    if($this->objectDateTime > $this->now ){
      return TRUE;
    }
    else{
      throw new exceptionHandler(__METHOD__.": the new date occurs in the past.");
    }
  }

  public function setMySQLFormat(){
    $this->convertedFormat='Y-m-d H:i:s.u';
  }

  public function setHTMLFormat(){
    $this->convertedFormat='m/d/Y H:i:s';
  }

  public function setHTMLDateFormat(){
    $this->convertedFormat='m/d/Y';
  }

  public function setHTMLTimeFormat(){
    $this->convertedFormat='H:i:s';
  }

  private function convert(){
    $this->converted = $this->objectDateTime->format($this->convertedFormat);
  }

  public function printConverted(){
    echo $this->converted;
  }
}