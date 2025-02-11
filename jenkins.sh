#bin/bash
pip install hvac
ansible-playbook -i jenkins-internal.pdevops72.online:8080, tools.yml -e tool_name=jenkins -e ansible_username=ec2-user -e ansible_password=DevOps321 -e jenkins_setup=true -e jenkins_job=false -e vault_token="hvs.T8WnPWmYmGZkPYlGAHXVmebk"

# here jenkins_setup=true and jenkins_job=true means dynamically to pass bool value by default it is false