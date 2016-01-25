component {
    // copy this to your application root to use as your Application.cfc
    // or incorporate the logic below into your existing Application.cfc

    // you can provide a specific application name if you want:
    this.name = hash( getBaseTemplatePath() );

    // any other application settings:
    this.sessionManagement = true;

    // set up per-application mappings as needed:
    this.mappings[ '/framework' ] = getDirectoryFromPath( getBaseTemplatePath() ) & '../framework';
    this.mappings[ '/model' ] = getDirectoryFromPath( getBaseTemplatePath() ) & '/model';
    // this.mappings[ '/app' ] expandPath( '../path/to/app' );

    // delegation of lifecycle methods to FW/1:
    function onRequestStart() {
      if (structKeyExists(url, "reset")) {
        reset();
      }
    }
    function onApplicationStart() {
      reset();
    }


    function reset() {
      application.beanFactory = new framework.ioc("");
      // transient
      application.beanFactory.declareBean("foo", "model.foo", false);
      // singleton
      application.beanFactory.declareBean("fooService", "model.fooService", true);
    }


}
