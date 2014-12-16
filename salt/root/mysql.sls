
include:
  - stackstrap.mysql.server
  - stackstrap.mysql.client

{% from "stackstrap/mysql/macros.sls" import mysql_user_db %}

/home/vagrant/dump.sql:
  file.managed:
    - source: salt://files/dump.sql

{{ mysql_user_db("kitchensink", "kitchensink",
                 database="kitchensink",
                 dump="/home/vagrant/dump.sql")
}}
