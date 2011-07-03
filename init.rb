require 'rails_exception_handler'
require 'patch/show_exceptions.rb'

%w{ models controllers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'lib/app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

Rails.application.paths.app.views << File.join(File.dirname(__FILE__), 'lib/app/views')
Rails.application.middleware.use RailsExceptionHandler if Rails.env == 'production'