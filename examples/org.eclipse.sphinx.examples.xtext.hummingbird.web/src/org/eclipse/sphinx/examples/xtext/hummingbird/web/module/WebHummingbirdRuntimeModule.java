/**
 * @Generated
 */
package org.eclipse.sphinx.examples.xtext.hummingbird.web.module;

import org.apache.log4j.Logger;

import com.google.inject.Binder;

public class WebHummingbirdRuntimeModule extends AbstractWebHummingbirdRuntimeModule {

	static final Logger logger = Logger.getLogger(WebHummingbirdRuntimeModule.class);
	
	/**
	 * Add Custom bindings here
	 */
	@Override
	public void configure(Binder binder) {
		super.configure(binder);
		logger.debug("Configuring language module " + this.getClass().getName());
	}
}
