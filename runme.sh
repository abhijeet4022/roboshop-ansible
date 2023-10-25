domain=dev.learntechnology.tech
components=("frontend" "mongodb" "catalogue" "redis" "user" "cart" "mysql" "shipping" "rabbitmq" "payment" "dispatch")
password=ansible_password

for component in "${components[@]}"; do
  inventory="${component}-${domain},"
  ansible-playbook -i "$inventory" -e ansible_user=centos -e ansible_password="$password" -e component="$component" main.yml
done

