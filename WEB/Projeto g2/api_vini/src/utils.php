<?php
class Utils
{
    public function validate($json, $expect)
    {
        $hasError = true;

        foreach ($expect as $ex => $value) {
            if(isset($json->{"$value"})){
                $hasError = false;
            }else{
                $hasError = true;
                break;
            }
        }

        return !$hasError;
    }
}