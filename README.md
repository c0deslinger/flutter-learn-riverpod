# Flutter Hook + Riverpod + GraphQL

Step:
- [controller] create graphql singleton & query class
  [controller] create status state
- [error] create error & exceptions class
- [model] create model class based on result graphql playground
- [datasources] create datasource class
- [repository] create repository class => linked to datasource
- [notifier] create notifier class => linked to repository, status state & model class
- [root] create provider class => linked to data source, repository & notifier
- [widget] create error_retry class
- [widget] create body builder => linked to status state & error retry
- [pages] create pages (screen) class => extends HookWidget, linked to provider class, notifier & body builder
- [main] wrap MyApp with ProviderScope => linked to home page