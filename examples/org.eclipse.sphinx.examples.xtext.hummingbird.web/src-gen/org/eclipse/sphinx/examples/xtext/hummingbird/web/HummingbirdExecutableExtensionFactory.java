/**
 * @Generated
 */
package org.eclipse.sphinx.examples.xtext.hummingbird.web;

import org.dslforge.xtext.common.guice.AbstractGuiceAwareWebExecutableExtensionFactory;
import org.osgi.framework.Bundle;
import org.eclipse.sphinx.examples.xtext.hummingbird.web.internal.Activator;

import com.google.inject.Injector;

public class HummingbirdExecutableExtensionFactory extends AbstractGuiceAwareWebExecutableExtensionFactory {

	@Override
	public Bundle getBundle() {
		return Activator.getInstance().getBundle();
	}
	
	@Override
	public Injector getInjector() {
		return Activator.getInstance().getInjector(Activator.ORG_ECLIPSE_SPHINX_EXAMPLES_XTEXT_HUMMINGBIRD);
	}
}
