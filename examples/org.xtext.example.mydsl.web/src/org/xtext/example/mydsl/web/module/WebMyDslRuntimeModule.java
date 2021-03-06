/**
 * @Generated
 */
package org.xtext.example.mydsl.web.module;

import org.apache.log4j.Logger;

import com.google.inject.Binder;

public class WebMyDslRuntimeModule extends AbstractWebMyDslRuntimeModule {

	static final Logger logger = Logger.getLogger(WebMyDslRuntimeModule.class);
	
	/**
	 * Add Custom bindings here
	 */
	@Override
	public void configure(Binder binder) {
		super.configure(binder);
		logger.debug("Configuring language module " + this.getClass().getName());
	}
}
