class Bs5ExpandableListGroup::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def list_prerequisites
    # We can add functionality to install hotwire automatically.
    exit if no?('Do you have Stimulus or Hotwire installed? [Y/n]')
    exit if no?('Do you have Bootstrap 5 installed and configured properly? [Y/n]')
  end

  def copy_js
    directory 'controllers', 'app/javascript/controllers'
  end

  def copy_css
    directory 'stylesheets', 'app/javascript/stylesheets'
  end
end
