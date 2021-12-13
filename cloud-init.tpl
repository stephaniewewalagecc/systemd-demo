#cloud-config
package_update: true
package_upgrade: true
package_reboot_if_required: true
runcmd:
  - apt-get update
  - apt-get install -y curl git
  - curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
  - apt-get install -y nodejs
  - mkdir /etherpad
  - cd /etherpad
  - git clone --branch master https://github.com/ether/etherpad-lite.git
  - cd ~
  - curl -fsSL https://raw.githubusercontent.com/stephaniewewalagecc/systemd-demo/main/run-etherpad.sh > run-etherpad.sh
  - chown -R ubuntu /etherpad
  - cd /etc/systemd/system
  - curl -fsSL https://raw.githubusercontent.com/stephaniewewalagecc/systemd-demo/main/terraform-demo-code.tf > stephtemd.service
  - systemctl daemon-reload 
  - systemctl enable stephtemd.service 
  - systemctl start --no-block stephtemd.service 
  - touch /deploy-complete
  
