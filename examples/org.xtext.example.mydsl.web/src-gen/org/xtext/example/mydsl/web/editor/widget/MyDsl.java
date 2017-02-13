/**
 * @Generated
 */
package org.xtext.example.mydsl.web.editor.widget;

import java.util.ArrayList;
import java.util.List;

import org.dslforge.styledtext.BasicText;
import org.eclipse.core.runtime.IPath;
import org.eclipse.core.runtime.Path;
import org.eclipse.rap.rwt.remote.Connection;
import org.eclipse.rap.rwt.remote.RemoteObject;
import org.eclipse.swt.widgets.Composite;

public class MyDsl extends BasicText {
	
	private static final long serialVersionUID = 1L;
	
	private static final String REMOTE_TYPE = "org.xtext.example.mydsl.web.editor.widget.MyDsl";
	
	public MyDsl(Composite parent, int style) {
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
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/ace/theme-mydsl.js"));
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/ace/mode-mydsl.js"));
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/ace/worker-mydsl.js"));
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/ace/snippets/mydsl.js"));
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/parser/antlr-all-min.js"));
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/parser/MyDslParser.js"));
		languageResources.add(new Path("src-js/org/xtext/example/mydsl/web/parser/MyDslLexer.js"));
		registerJsResources(languageResources, getClassLoader());
		loadJsResources(languageResources);
	}

	@Override
	protected ClassLoader getClassLoader() {
		ClassLoader classLoader = MyDsl.class.getClassLoader();
		return classLoader;
	}
}
