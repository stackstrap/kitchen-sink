
include:
  - stackstrap.php5.fpm

{% from "stackstrap/php5/macros.sls" import php5_fpm_instance %}

{{ php5_fpm_instance("kitchensink.dev", '5000', "vagrant", "vagrant") }}
