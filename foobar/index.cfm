<cfscript>
foo = application.beanFactory.getBean("foo");

writeDump(var=foo, label="foo from DI/1 develop");

// when called directly after DI/1 is configured then this returns fooService. On
// subsequent calls it returns undefined
writeDump(var=foo.getFooService(), label="foo.getFooService() from DI/1 develop");
</cfscript>
