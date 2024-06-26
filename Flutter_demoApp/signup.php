<?php 
    include "config.php";
    $firstname = $_POST['FirstName'];
    $lastname = $_POST['LastName'];
    $email = $_POST['Email'];
    $address = $_POST['Address'];
    $phonenumber = $_POST['PhoneNumber'];
    $volunteerexp = $_POST['Volunteer_Exp'];
    //$image = $_FILES['Image']['FirstName'];

    $password = $_POST['Password'];
    
    if($firstname!=""&&$lastname!=""&&$email!=""&&$address!=""&&$phonenumber!=""&&$volunteerexp!=""){

    $sql = "insert into users (FirstName,LastName,Email,Password,PhoneNumber,Address,Volunteer_Exp) values ('$firstname','$lastname','$email','$password','$phonenumber','$address','$volunteerexp')";

    if($con->query($sql)){
        echo "true";
    }else{
        echo "false";
    }

}
?>