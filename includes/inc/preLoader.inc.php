<?php
/**
 * @param $type
 * @param $array
 * @return bool
 */
function preLoader($type,$array){
    if(isset($type,$array) AND is_array($array)){
        switch($type){
            case 'css':
                                foreach ($array as $key => $value){
                                        echo '<link rel="stylesheet" type="text/css" href="'.$value.'" />';
                                };
                                return TRUE;
                                break;
            case 'js':
                                foreach ($array as $key => $value){
                                        echo '<script type="text/javascript" src="'.$value.'"></script>';
                                };
                                return TRUE;
                                break;
            default:return FALSE;break;
        }
    }
    else{
        return FALSE;
    }
}
