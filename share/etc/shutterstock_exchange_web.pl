{

  name => 'Shutterstock::Exchange::Web',
  default_view => 'HTML',
  disable_component_resolution_regex_fallback => 1,

  'Plugin::URLMap' => {
    '/favicon.ico' => {
      File => { file => '__path_to(share,static,favicon.ico)__' }},
    '/static' => {
      File => { root => '__path_to(share,static)__' }},
  },
  'Plugin::EnableMiddleware' => [
    'Debug',
    'Debug::DBIC::QueryLog', {querylog_args => {passthrough=>1}},
  ],
  'Controller::Root' => {
    namespace => '',
  },
  'Model::Schema' => {
    traits => ['FromMigration','QueryLog::AdoptPlack'],
    schema_class => 'Shutterstock::Exchange::Schema',
    install_if_needed => {
      default_fixture_sets => ['all_tables']},
  },
  'View::HTML' => {
    INCLUDE_PATH => [ '__path_to(share,html)__',
      '__path_to(share,html,lib)__' ],
    TEMPLATE_EXTENSION => '.tt',
    PRE_PROCESS => 'pre_process',
    WRAPPER => 'page.tt',
  },

};

