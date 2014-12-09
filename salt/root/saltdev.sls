python-dev:
  pkg.installed

python-m2crypto:
  pkg.installed

{% set virtualenv = "/home/vagrant/virtualenv" -%}

kitchensink_requirements:
  cmd:
    - run
    - name: "source {{ virtualenv }}/bin/activate; pip install -r /home/vagrant/requirements.txt"
    - shell: /bin/bash
    - user: vagrant
    - require:
      - cmd: kitchensink_virtualenv

https://github.com/saltstack/salt.git:
  git.latest:
    - bare: True
    - target: /home/vagrant/salt-repo
    - user: vagrant

# To test a pull request
#   git fetch origin refs/pull/*/head:refs/remotes/origin/pr/*
# or
#   git fetch origin refs/pull/[PR_NUMBER]/head:refs/remotes/origin/pr/[PR_NUMBER]
# and
#   git checkout origin/pr/[PR_NUMBER]
