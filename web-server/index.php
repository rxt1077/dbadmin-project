<html>
  <head>
    <title>Welcome to My Music Collection!</title>
  </head>
  <body>
    <h1> The page connects, now MAKE IT WORK! </h1>
  <?php
      require_once 'autoload.php';
      
      $dbc = "pgsql:host=$host;port=5432;dbname=$dbname;user=$username;password=$password";

      try {
	  $conn = new PDO($dbc);
	  echo "Connected to $dbname at $host successfully.";
      } catch (PDOException $pe) {
	  die("Connection to $dbname failed: " . $pe->getMessage());
      }
      
      /*
      if(! $dbc ) {
        die("Connection failed: ".mysqli_connect_error());
      }
     
      $dbc = pg_connect("host=$host dbname=$dbname user=$username password=$password");
       */

      

      $query = mysqli_query($conn, "SELECT * FROM artists")
        or die (mysqli_error($conn).$query);

      while ($row = mysqli_fetch_array($query)) {
        echo
	  "<tr>
            <td>{$row['name']}</td>
	    <td>{$row['genre']}</td>
            <td>{$row['record_label']}</td>
	  </tr>";
      }

      mysqli_close($conn);
    ?>
  </body>
</html>
