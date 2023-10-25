domain=dev.learntechnology.tech
components=("frontend" "mongodb" "catalogue" "redis" "user" "cart" "mysql" "shipping" "rabbitmq" "payment" "dispatch")
password="$ansible_password"
if [ -z "${password}" ]; then
  echo -e "\e[31mWarning: Please mention the password for ansible_user.\e[0m"
  exit 1
fi

for component in "${components[@]}"; do
  inventory="${component}-${domain},"
  echo -e "\e[33mConfiguring the "${component}" component\e[0m"
  ansible-playbook -i "$inventory" -e ansible_user=centos -e ansible_password="$password" -e component="$component" main.yml
done

