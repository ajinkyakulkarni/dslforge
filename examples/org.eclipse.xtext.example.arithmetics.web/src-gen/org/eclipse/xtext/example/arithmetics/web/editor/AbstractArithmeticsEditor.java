/**
 * @Generated
 */
package org.eclipse.xtext.example.arithmetics.web.editor;

import org.dslforge.styledtext.BasicText;
import org.dslforge.xtext.common.XtextContentAssistEnabledEditor;
import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.xtext.example.arithmetics.web.editor.widget.Arithmetics;
import org.eclipse.xtext.example.arithmetics.web.internal.Activator;

public abstract class AbstractArithmeticsEditor extends XtextContentAssistEnabledEditor {

	public AbstractArithmeticsEditor() {
		super();
		setLanguageName(Activator.ORG_ECLIPSE_XTEXT_EXAMPLE_ARITHMETICS_ARITHMETICS);
		setInjector(Activator.getInstance().getInjector(Activator.ORG_ECLIPSE_XTEXT_EXAMPLE_ARITHMETICS_ARITHMETICS));
	}
	
	@Override
	protected BasicText createTextWidget(Composite parent, int styles) {
		Arithmetics arithmeticsWidget = new Arithmetics(parent, styles);
		GridData textLayoutData = new GridData();
		textLayoutData.horizontalAlignment = SWT.FILL;
		textLayoutData.verticalAlignment = SWT.FILL;
		textLayoutData.grabExcessHorizontalSpace = true;
		textLayoutData.grabExcessVerticalSpace = true;
		arithmeticsWidget.setLayoutData(textLayoutData);
		arithmeticsWidget.setEditable(true);
		return arithmeticsWidget;
	}
}
