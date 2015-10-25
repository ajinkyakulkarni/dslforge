/**
 * <copyright>
 *
 * Copyright (c) 2015 DSLFORGE. All rights reserved.
 * 
 * This program and the accompanying materials are made available 
 * under the terms of the Eclipse Public License v1.0 which 
 * accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Amine Lajmi - Initial API and implementation
 *
 * </copyright>
 */
package org.dslforge.workbench.tools;

import java.net.URL;
import java.net.URLClassLoader;

public class DynamicURLClassLoader extends URLClassLoader{

	public DynamicURLClassLoader(URLClassLoader classLoader) {
	    super(classLoader.getURLs());
	}

	@Override
	public void addURL(URL url) {
	    super.addURL(url);
	}
}
