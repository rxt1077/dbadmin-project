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

# Now that you've got a PDO connection to your DB, you need to do the following in PDO (not mysqli):
#
#        echo
#	  "<tr>
#            <td>{$row['name']}</td>
#	    <td>{$row['genre']}</td>
#            <td>{$row['record_label']}</td>
#	  </tr>";
#      }
#

    ?>
  </body>
</html>
