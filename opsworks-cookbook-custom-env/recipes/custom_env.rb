# Recipe used for a setup and deploy events
Chef::Log.info("Create config/application.yml file...")

Chef::Log.info(">>>>>>> node[:deploy]")
Chef::Log.info(node[:deploy])

node[:deploy].each do |application, deploy|
  Chef::Log.info("Debugg env variables")
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

  Chef::Log.info(">>>>>>> File.exists?")
  Chef::Log.info(File.exists?("/srv/www/mejuri_web/shared/config/application.yml"))
  Chef::Log.info(File.read("/srv/www/mejuri_web/shared/config/application.yml"))
end
