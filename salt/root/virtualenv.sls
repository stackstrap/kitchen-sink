include:
  - stackstrap.virtualenv

{% set virtualenv = "/home/vagrant/virtualenv" -%}

kitchensink_virtualenv:
  cmd:
    - run
    - name: "virtualenv {{ virtualenv }} && rm -f {{ virtualenv }}/lib*/*/no-global-site-packages.txt"
    - unless: "test -d {{ virtualenv }}"
    - user: vagrant
    - require:
      - pkg: virtualenv_pkgs

/home/vagrant/requirements.txt:
  file.managed:
    - source: salt://files/requirements.txt

kitchensink_profile_setup:
  file:
    - append
    - name: /home/vagrant/.profile
    - require:
      - user: vagrant
    - text:
      - source ~/virtualenv/bin/activate
      - cd /vagrant
