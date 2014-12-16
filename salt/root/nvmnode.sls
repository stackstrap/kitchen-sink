
include:
  - stackstrap.nvmnode

{% from "stackstrap/nvmnode/macros.sls" import nvmnode %}

{{ nvmnode("kitchensink.dev", "vagrant", "vagrant",
           node_globals=["harp"])
}}

# vim: set ft=yaml ts=2 sw=2 sts=2 et ai :
