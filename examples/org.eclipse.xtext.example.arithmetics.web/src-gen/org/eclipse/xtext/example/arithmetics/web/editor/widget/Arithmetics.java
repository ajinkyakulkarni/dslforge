/**
 * @Generated
 */
package org.eclipse.xtext.example.arithmetics.web.editor.widget;

import java.util.ArrayList;
import java.util.List;

import org.dslforge.styledtext.BasicText;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.Path;
import org.eclipse.rap.rwt.remote.Connection;
import org.eclipse.rap.rwt.remote.RemoteObject;
import org.eclipse.swt.widgets.Composite;

public class Arithmetics extends BasicText {
	
	private static final long serialVersionUID = 1L;
	
	private static final String REMOTE_TYPE = "org.eclipse.xtext.example.arithmetics.web.editor.widget.Arithmetics";
	
	public Arithmetics(Composite parent, int style) {
		super(parent, style);
	}
	
	@Override
	protected RemoteObject createRemoteObject(Connection connection) {
		return connection.createRemoteObject(REMOTE_TYPE);
	}
	
	@Override 
	protected void setupClient() {
		super.setupClient();
		List<IPath> languageResources = new ArrayList<IPath>();
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/ace/theme-arithmetics.js"));
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/ace/mode-arithmetics.js"));
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/ace/worker-arithmetics.js"));
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/ace/snippets/arithmetics.js"));
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/parser/antlr-all-min.js"));
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/parser/ArithmeticsParser.js"));
		languageResources.add(new Path("src-js/org/eclipse/xtext/example/arithmetics/web/parser/ArithmeticsLexer.js"));
		registerJsResources(languageResources, getClassLoader());
		loadJsResources(languageResources);
	}

	@Override
	protected ClassLoader getClassLoader() {
		ClassLoader classLoader = Arithmetics.class.getClassLoader();
		return classLoader;
	}
}
