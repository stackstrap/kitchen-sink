{% from "stackstrap/utils/users.sls" import skeleton -%}

{{ skeleton("vagrant", 1000, 1000, remove_groups=False) }}

# vim: set ft=yaml ts=2 sw=2 sts=2 et ai :
