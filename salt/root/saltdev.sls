python-dev:
  pkg.installed

python-m2crypto:
  pkg.installed

{% set virtualenv = "/home/vagrant/virtualenv" -%}
{% set home = "/home/vagrant" -%}
{% set branch = "2014.7" -%}

# You can set this to a GitHub Pull Request ID
{% set pull_request = False -%}

{{ home }}/salt-requirements.txt:
  file.managed:
    - source: salt://files/salt-requirements.txt

salt_requirements:
  cmd:
    - run
    - name: "source {{ virtualenv }}/bin/activate; pip install -r {{ home }}/salt-requirements.txt"
    - shell: /bin/bash
    - user: vagrant
    - require:
      - cmd: kitchensink_virtualenv

salt_github:
  git.latest:
    - name: https://github.com/saltstack/salt.git
    - rev: {{ branch }}
    - target: {{ home }}/salt-repo
    - unless: {{ virtualenv }}/bin/salt-call --version
    - user: vagrant
    - require:
      - cmd: salt_requirements

{% if pull_request %}
fetch_pull_request:
  cmd:
    - run
    - cwd: {{ home }}/salt-repo
    - unless: {{ virtualenv }}/bin/salt-call --version
    - name: "git fetch origin refs/pull/{{ pull_request }}/head:refs/remotes/origin/pr/{{ pull_request }}"
    - user: vagrant
    - require:
      - git: salt_github

checkout_pull_request:
  cmd:
    - run
    - cwd: {{ home }}/salt-repo
    - unless: {{ virtualenv }}/bin/salt-call --version
    - name: "git checkout origin/pr/{{ pull_request }}"
    - user: vagrant
    - require:
      - cmd: fetch_pull_request
{% endif %}

install_salt_dev:
  cmd:
    - run
    - cwd: {{ home }}
    - unless: {{ virtualenv }}/bin/salt-call --version
    - name: {{ virtualenv }}/bin/pip install -e {{ home }}/salt-repo
    - require:
      - git: salt_github
