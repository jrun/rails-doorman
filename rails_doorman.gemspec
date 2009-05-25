# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_doorman}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Burks"]
  s.date = %q{2009-05-25}
  s.description = %q{Rails plugin that provides an allow/deny DSL for controlling access}
  s.email = %q{jeremy.burks@gmail.com}
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "rails/init.rb", "lib/rails_doorman", "lib/rails_doorman/helpers.rb", "lib/rails_doorman/rule.rb", "lib/rails_doorman.rb", "spec/fixtures", "spec/fixtures/app", "spec/fixtures/app/app", "spec/fixtures/app/app/controllers", "spec/fixtures/app/app/controllers/access_control_by_host_controller.rb", "spec/fixtures/app/app/controllers/access_control_by_user_agent_controller.rb", "spec/fixtures/app/app/controllers/allow_all_by_default_controller.rb", "spec/fixtures/app/app/controllers/allowed_and_denied_roles_controller.rb", "spec/fixtures/app/app/controllers/allowed_and_denied_users_controller.rb", "spec/fixtures/app/app/controllers/allowed_role_controller.rb", "spec/fixtures/app/app/controllers/allowed_role_with_only_controller.rb", "spec/fixtures/app/app/controllers/allowed_user_controller.rb", "spec/fixtures/app/app/controllers/application_controller.rb", "spec/fixtures/app/app/controllers/denied_role_controller.rb", "spec/fixtures/app/app/controllers/denied_user_controller.rb", "spec/fixtures/app/app/controllers/deny_all_controller.rb", "spec/fixtures/app/app/controllers/explicitly_allow_all_controller.rb", "spec/fixtures/app/app/controllers/test_controller.rb", "spec/fixtures/app/app/controllers/view_helpers_controller.rb", "spec/fixtures/app/app/helpers", "spec/fixtures/app/app/helpers/application_helper.rb", "spec/fixtures/app/app/models", "spec/fixtures/app/app/models/user.rb", "spec/fixtures/app/app/views", "spec/fixtures/app/app/views/layouts", "spec/fixtures/app/app/views/layouts/application.html.erb", "spec/fixtures/app/app/views/view_helpers", "spec/fixtures/app/app/views/view_helpers/allow_via_role.html.erb", "spec/fixtures/app/app/views/view_helpers/deny_via_role.html.erb", "spec/fixtures/app/config", "spec/fixtures/app/config/boot.rb", "spec/fixtures/app/config/environment.rb", "spec/fixtures/app/config/environments", "spec/fixtures/app/config/environments/development.rb", "spec/fixtures/app/config/environments/production.rb", "spec/fixtures/app/config/environments/test.rb", "spec/fixtures/app/config/initializers", "spec/fixtures/app/config/initializers/backtrace_silencers.rb", "spec/fixtures/app/config/initializers/inflections.rb", "spec/fixtures/app/config/initializers/mime_types.rb", "spec/fixtures/app/config/initializers/new_rails_defaults.rb", "spec/fixtures/app/config/initializers/session_store.rb", "spec/fixtures/app/config/locales", "spec/fixtures/app/config/locales/en.yml", "spec/fixtures/app/config/routes.rb", "spec/fixtures/app/db", "spec/fixtures/app/db/foo.txt", "spec/fixtures/app/doc", "spec/fixtures/app/doc/README_FOR_APP", "spec/fixtures/app/lib", "spec/fixtures/app/lib/tasks", "spec/fixtures/app/log", "spec/fixtures/app/public", "spec/fixtures/app/public/404.html", "spec/fixtures/app/public/422.html", "spec/fixtures/app/public/500.html", "spec/fixtures/app/public/favicon.ico", "spec/fixtures/app/public/images", "spec/fixtures/app/public/images/rails.png", "spec/fixtures/app/public/javascripts", "spec/fixtures/app/public/javascripts/application.js", "spec/fixtures/app/public/javascripts/controls.js", "spec/fixtures/app/public/javascripts/dragdrop.js", "spec/fixtures/app/public/javascripts/effects.js", "spec/fixtures/app/public/javascripts/prototype.js", "spec/fixtures/app/public/robots.txt", "spec/fixtures/app/public/stylesheets", "spec/fixtures/app/Rakefile", "spec/fixtures/app/README", "spec/fixtures/app/script", "spec/fixtures/app/script/about", "spec/fixtures/app/script/console", "spec/fixtures/app/script/dbconsole", "spec/fixtures/app/script/destroy", "spec/fixtures/app/script/generate", "spec/fixtures/app/script/performance", "spec/fixtures/app/script/performance/benchmarker", "spec/fixtures/app/script/performance/profiler", "spec/fixtures/app/script/plugin", "spec/fixtures/app/script/runner", "spec/fixtures/app/script/server", "spec/fixtures/app/test", "spec/fixtures/app/test/fixtures", "spec/fixtures/app/test/functional", "spec/fixtures/app/test/integration", "spec/fixtures/app/test/performance", "spec/fixtures/app/test/performance/browsing_test.rb", "spec/fixtures/app/test/test_helper.rb", "spec/fixtures/app/test/unit", "spec/fixtures/app/tmp", "spec/fixtures/app/vendor", "spec/fixtures/app/vendor/plugins", "spec/fixtures/app/vendor/plugins/doorman", "spec/fixtures/app/vendor/plugins/doorman/init.rb", "spec/rails_doorman", "spec/rails_doorman/class_methods_spec.rb", "spec/rails_doorman/rule_spec.rb", "spec/spec_helper.rb", "features/doorman.feature", "features/step_definitions", "features/step_definitions/common_steps.rb", "features/step_definitions/webrat_steps.rb", "features/support", "features/support/authorized_matcher.rb", "features/support/env.rb", "features/support/paths.rb", "features/support/unauthorized_matcher.rb"]
  s.homepage = %q{http://github.com/jrun/rails_doorman/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Rails plugin that provides an allow/deny DSL for controlling access}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 2.3.2"])
    else
      s.add_dependency(%q<rails>, [">= 2.3.2"])
    end
  else
    s.add_dependency(%q<rails>, [">= 2.3.2"])
  end
end
