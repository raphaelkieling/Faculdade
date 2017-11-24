<?php
class Db
{
    private $dbhost = 'localhost';
    private $dbuser = 'TecBox';
    private $dbpass = 'IWTI@2017';
    private $dbname = 'db_g2_web';

    public function connect()
    {
        $mysql_connect_str = "mysql:host=$this->dbhost;dbname=$this->dbname";
        $dbConnection = new PDO($mysql_connect_str, $this->dbuser, $this->dbpass);

        $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        return $dbConnection;
    }

    public function query($sql)
    {
        try {
            $db = $this->connect();
            $stmt = $db->query($sql);
            $db = null;
        } catch (PDOException $e) {
            $stmt = null;
            $db = null;
            echo '{"error":{"text":' . $e->getMessage() . '}';
        }
        

        return $stmt;
    }
}