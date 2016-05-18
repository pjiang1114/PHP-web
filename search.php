<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>

<?php
$s_cpu_cpu_id = "cpu.cpu_id";
$s_cpu_speed_mhz = "cpu.speed_mhz";
$s_customer_cust_num = "customer.cust_num";
$s_customer_name = "customer.name";
$s_customer_addr = "customer.addr";
$s_orders_order_num = "orders.order_num";
$s_orders_cust_num = "orders.cust_num";
$s_orders_cpu = "orders.cpu ";
$s_orders_ram_mhz ="orders.ram_mhz";
 
$cpu_id = $_POST['cpu_name'];//echo $cpu_id;

$cpu_speed = $_POST['cpu_speed'];//echo $cpu_speed;

$ram_size = $_POST['ram_size'];//echo $ram_size;

$opt1 =$_POST['cpu_speed_option'];//echo $opt1;
$opt2 = $_POST['ram_size_option'];//echo $opt2;
$selection=TRUE;
$tables=TRUE;

	if(!empty($_POST['check_list']))
	{ //echo "Search selection(s) is(are) : ";
      foreach($_POST['check_list'] as $select)
      { //echo "$select</br>";
      	switch ($select){
      		case "all":
      		   $tables="cpu, customer, orders";
      		   $selection=$s_cpu_cpu_id.",".$s_cpu_speed_mhz.",".$s_customer_cust_num.",".$s_customer_name.",".$s_customer_addr.",".$s_orders_order_num.",".$s_orders_ram_mhz;
      		   //echo "$selection</br>";
      		   break;
      		case  "cpu_id":
      		    if(strpos($tables,"cpu")!==FALSE)
	      		{
	      			$selection.=",".$s_cpu_cpu_id;
	      			break;
	      		}
	      	    else
	      	    {
	      	       $tables.=",cpu";
	      		   $selection.=",".$s_cpu_cpu_id;
	      		   break;
      	        }
      		 case "speed_mhz":
      		     if(strpos($tables,"cpu")!==FALSE)
      		     {
	      		   $selection.=",".$s_cpu_speed_mhz;
	      		   break;
      		     }
      		     else
      		     {
      		     	$tables.=",cpu";
      		     	$selection.=",".$s_cpu_speed_mhz;
	      		    break;
      		     }
      		 case "cust_num":
      		     if(strpos($tables,"customer")!==FALSE)
      		     {
	      		   $selection.=",".$s_customer_cust_num ;
	      		   break;
	      		 }
	      		 else
	      		 {
	      		 	$tables.=",customer";
	      		 	$selection.=",".$s_customer_cust_num;
	      		 	break;
	      		 }

      		 case "name":
      		     if(strpos($tables,"customer")!==FALSE)
      		     {
      		     	$selection.=",".$s_customer_name;
      		     	break;
      		     }
      		     else
      		     {
      		       $tables.=", customer";
	      		   $selection.=",".$s_customer_name ;
	      		   break;
      	         }
      		 case "addr":
      		     if(strpos($tables,"customer")!==FALSE)
      		     {
      		     	$selection.=",".$s_customer_addr;
      		     	break;
      		     }
      		     else
      		     {
      		       $tables.=", customer";
	      		   $selection.=",".$s_customer_addr;
	      		   break;
      	         }

      		 case "order_num":
	      		 if(strpos($tables,"orders")!==FALSE)
      		     {
      		     	$selection.=",".$s_orders_order_num;
      		     	break;
      		     }
      		     else
      		     {
      		       $tables.=", orders";
	      		   $selection.=",".$s_orders_order_num ;
	      		   break;
      	         }
      	         
      		 case "ram_mhz":
      		     if(strpos($tables,"orders")!==FALSE)
      		     {
      		     	$selection.=",".$s_orders_ram_mhz;
      		     	break;
      		     }
      		     else
      		     {
      		       $tables.=", orders";
	      		   $selection.=",".$s_orders_ram_mhz ;
	      		   break;
      	         }
      	}
        
      }
	}

echo "tables:".$tables."</br>"."selctions:".$selection."</br>"; 
echo"<br>str ".strpos($tables, "5")."</br>";
if(strpos($tables,"cpu") && strpos($tables,"customer") && !strpos($tables,"orders"))
{ 
	$tables="cpu, customer, orders ";
	$cond =" cpu.cpu_id=orders.cpu AND customer.cust_num=orders.cust_num ";
  //echo "1";
}
elseif(strpos($tables,"cpu") && !strpos($tables,"customer") && strpos($tables,"orders"))
{
	$tables="cpu, orders ";
	$cond =" cpu.cpu_id=orders.cpu ";
  //echo "2";
}
elseif(!strpos($tables,"cpu") && strpos($tables,"customer") && strpos($tables,"orders"))
{
	$tables="customer, orders ";
	$cond =" customer.cust_num=orders.cust_num ";
  echo "3";
}
elseif(strpos($tables,"cpu") && !strpos($tables,"customer") && !strpos($tables,"orders"))
{
	$tables="cpu ";
	$cond ="";
  //echo "4";
}
elseif(!strpos($tables,"cpu") && strpos($tables,"customer") && !strpos($tables,"orders"))
{
	$tables="customer ";
	$cond ="";
 // echo "5";
}
elseif(!strpos($tables,"cpu") && !strpos($tables,"customer") && strpos($tables,"orders"))
{
	$tables="orders ";
	$cond ="";
  //echo "6";
}
//elseif(strpos($tables,"cpu") && strpos($tables,"customer") && strpos($tables,"orders"))
//{
//	$tables="cpu, customer, orders ";
//	$cond =" cpu.cpu_id=orders.cpu AND customer.cust_num=orders.cust_num ";
//}
else
{
  $tables="cpu, customer, orders ";
  $cond ="";
  echo "7";
}
echo "tables:".$tables."</br>"."selctions:".$selection."</br>"; 
$servername = "localhost";
$username = "root";
$password = "";
$database = "cs3010";
$db = mysql_connect($servername, $username, $password, $database);
if (!$db) {
    echo "Unable to connect to DB: " . mysql_error();
    exit;
}
if (!mysql_select_db($database)) {
    echo "Unable to select mydbname: " . mysql_error();
    exit;
}
$selectionarray=explode(',', $selection);
$count=count($selectionarray);
//echo"count selection is $count";
$query = "SELECT ".$selection." FROM ".$tables;
//echo "query is:".$query;
if (  (strpos($tables,"cpu") && strpos($tables,"customer")&& !strpos($tables,"orders")) 
   || (strpos($tables,"cpu") && strpos($tables,"orders") && !strpos($tables,"customer"))
   || (strpos($tables,"customer") && strpos($tables,"orders")&& !strpos($tables,"cpu"))
   || (strpos($tables,"cpu") && strpos($tables,"customer") && strpos($tables,"orders")) )
{
	$query.=" WHERE $cond";		
}


if(!empty($cpu_id))
{
	$query.="AND cpu.cpu_id = $cpu_id ";
}
if(!empty($cpu_speed))
{
	$query.="AND cpu.speed_mhz $opt1 $cpu_speed ";
}
if(!empty($ram_size))
{
	$query.="AND orders.ram_mhz $opt2 $ram_size";
}
$query.=";";
	//	"AND cpu.cpu_id = ".$cpu_id ." AND cpu.speed_mhz ".
      //  $opt1." ".$cpu_speed." AND orders.ram_mhz ".$opt2." ".$ram_size.";";
  // echo "$query </br>";        
$result = mysql_query($query);
if (!$result) {
    echo "Could not successfully run query ($query) from DB: " . mysql_error();
    exit;
}
$no_rows = mysql_num_rows($result);
if ($no_rows == 0) {
    echo "No rows found, nothing to print so am exiting";
    exit;
}

$no_fields = mysql_num_fields($result);
if ($no_fields == 0) {
    echo "No fields found, nothing to print so am exiting";
    exit;
}
echo "<table><tr><th>Result</th></tr>";
	for($i=1;$i<=$count;$i++)
	{
	echo "<td>".$selectionarray[$i]."</td>";
	}
while ($line=mysql_fetch_array($result,MYSQL_NUM))
{  
	echo "<tr>";
	for($i=1;$i<=$count;$i++)
	{
	echo "<td>".$line[$i]."</td>";
	}
	echo "</tr>";
}
echo "</table>";
mysqli_close($db);

?>
</body>
</html>