/**
 * @Generated
 */
package org.eclipse.xtext.example.arithmetics.web;

import org.dslforge.xtext.common.guice.AbstractGuiceAwareWebExecutableExtensionFactory;
import org.osgi.framework.Bundle;
import org.eclipse.xtext.example.arithmetics.web.internal.Activator;

import com.google.inject.Injector;

public class ArithmeticsExecutableExtensionFactory extends AbstractGuiceAwareWebExecutableExtensionFactory {

	@Override
	public Bundle getBundle() {
		return Activator.getInstance().getBundle();
	}
	
	@Override
	public Injector getInjector() {
		return Activator.getInstance().getInjector(Activator.ORG_ECLIPSE_XTEXT_EXAMPLE_ARITHMETICS_ARITHMETICS);
	}
}
