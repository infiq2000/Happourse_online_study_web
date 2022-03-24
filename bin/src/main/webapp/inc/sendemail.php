<?php

    $to = "someone@email.com";
    $from = $_REQUEST['email'];
    $name = $_REQUEST['name'];
    $headers = "From: $from";
    $subject = "You have a message from your Template";

    $fields = array();
    $fields{"name"}    = "Name";
    $fields{"email"}    = "Email";
    $fields{"phone"}    = "Phone Number";
    $fields{"message"}   = "Message";
    

    $body = "Here is the message you got:\n\n"; foreach($fields as $a => $b){   $body .= sprintf("%20s: %s\n",$b,$_REQUEST[$a]); }

    $send = mail($to, $subject, $body, $headers);

?>