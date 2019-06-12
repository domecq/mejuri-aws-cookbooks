# Recipe used for a setup and deploy events
Chef::Log.info("Create config/application.yml file...")

node[:deploy].each do |application, deploy|
  Chef::Log.info("Debugg env variables")
  Chef::Log.info(">>>>>>> custom_env")
  Chef::Log.info(deploy[:custom_env].to_h)
  Chef::Log.info(">>>>>>> environment_variables")
  Chef::Log.info(deploy[:environment_variables].to_h)
  Chef::Log.info(">>>>>>> environment")
  Chef::Log.info(deploy[:environment].to_h)

  environment_variables = deploy[:custom_env].to_h.merge(deploy[:environment_variables].to_h)

  Chef::Log.info(">>>>>>> var environment_variables")
  Chef::Log.info(environment_variables)

  custom_env_template do
    application application
    deploy deploy
    env environment_variables
  end
end
