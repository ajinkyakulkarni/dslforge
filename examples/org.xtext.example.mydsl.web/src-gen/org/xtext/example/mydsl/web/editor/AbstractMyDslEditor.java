/**
 * @Generated
 */
package org.xtext.example.mydsl.web.editor;

import org.dslforge.styledtext.BasicText;
import org.dslforge.xtext.common.XtextContentAssistEnabledEditor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Composite;
import org.xtext.example.mydsl.web.editor.widget.MyDsl;
import org.xtext.example.mydsl.web.internal.Activator;

public abstract class AbstractMyDslEditor extends XtextContentAssistEnabledEditor {

	public AbstractMyDslEditor() {
		super();
		setLanguageName(Activator.ORG_XTEXT_EXAMPLE_MYDSL_MYDSL);
		setInjector(Activator.getInstance().getInjector(Activator.ORG_XTEXT_EXAMPLE_MYDSL_MYDSL));
	}
	
	@Override
	protected BasicText createTextWidget(Composite parent, int styles) {
		MyDsl myDslWidget = new MyDsl(parent, styles);
		GridData textLayoutData = new GridData();
		textLayoutData.horizontalAlignment = SWT.FILL;
		textLayoutData.verticalAlignment = SWT.FILL;
		textLayoutData.grabExcessHorizontalSpace = true;
		textLayoutData.grabExcessVerticalSpace = true;
		myDslWidget.setLayoutData(textLayoutData);
		myDslWidget.setEditable(true);
		return myDslWidget;
	}
}
