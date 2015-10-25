package org.dslforge.example.java.web.internal;

import java.net.URL;
import java.util.Collections;
import java.util.Map;

import org.eclipse.jface.resource.ImageDescriptor;
import org.eclipse.jface.resource.ImageRegistry;
import org.eclipse.swt.graphics.Image;
import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.eclipse.xtext.resource.XtextResourceSet;
import org.osgi.framework.BundleContext;

import com.google.common.collect.Maps;
import com.google.inject.Injector;

/**
 * The activator class controls the plug-in life cycle
 */
public class Activator extends AbstractUIPlugin {

	public static final String LANGUAGE_NAME = "org.dslforge.example.Java";

	// The plug-in ID
	public static final String PLUGIN_ID = "org.dslforge.example.java.web"; //$NON-NLS-1$

	// The shared instance
	private static Activator plugin;
	
	private Map<String, Injector> injectors = Collections.synchronizedMap(Maps.<String, Injector> newHashMapWithExpectedSize(1));
	
	public Injector getInjector(String language) {
		synchronized (injectors) {
			Injector injector = injectors.get(language);
//			if (injector == null) {
//				injectors.put(language, injector = new WebJavaStandaloneSetup().createInjector(language));
//			}
			return injector;
		}
	}
	
	private XtextResourceSet resourceSet;
	
	public XtextResourceSet getResourceSet() {
		if (resourceSet==null)
			resourceSet = new XtextResourceSet();
		return resourceSet;
	}
	
	public static Activator getInstance() {
		return plugin;
	}
	


	/**
	 * The constructor
	 */
	public Activator() {
	}

	
	/*
	 * (non-Javadoc)
	 * @see org.eclipse.ui.plugin.AbstractUIPlugin#start(org.osgi.framework.BundleContext)
	 */
	public void start(BundleContext bundleContext) throws Exception {
		super.start(bundleContext);
		plugin = this;

	}

	/*
	 * (non-Javadoc)
	 * @see org.eclipse.ui.plugin.AbstractUIPlugin#stop(org.osgi.framework.BundleContext)
	 */
	public void stop(BundleContext context) throws Exception {
		plugin = null;
		super.stop(context);
	}

	/**
	 * Returns the shared instance
	 *
	 * @return the shared instance
	 */
	public static Activator getDefault() {
		return plugin;
	}

	@Override
	protected void initializeImageRegistry(ImageRegistry reg) {
		addImageFilePath(JavaImageProvider.FILE);
		addImageFilePath(JavaImageProvider.WIZARD);
	}

	private void addImageFilePath(String relativeURL) {
		Image image = plugin.getImageRegistry().get(relativeURL);
		if (image == null) {
			URL imageURL = plugin.getBundle().getEntry(relativeURL);
			ImageDescriptor descriptor = ImageDescriptor.createFromURL(imageURL);
			image = descriptor.createImage();
			plugin.getImageRegistry().put(relativeURL, image);
		}
	}

	public static ImageDescriptor getImageDescriptor(String relativeURL) {
		URL entry = plugin.getBundle().getEntry(relativeURL);
		if (entry != null) {
			return ImageDescriptor.createFromURL(entry);
		}
		return null;
	}
}