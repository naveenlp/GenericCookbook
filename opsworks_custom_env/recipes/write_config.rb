# Set up app's custom configuration in the environment.
# See https://forums.aws.amazon.com/thread.jspa?threadID=118107

node[:deploy].each do |application, deploy|
  
  if node[:custom_env][application].nil?
      Chef::Log.debug("Skipping opsworks_custom_env because application #{application} has no Figaro env variable")
      next
  end

  custom_env_template do
    application application
    deploy deploy
    env node[:custom_env][application]
  end
  
end
