/**
 * @Generated
 */
package org.eclipse.xtext.example.arithmetics.web.module;

import org.dslforge.styledtext.jface.IContentAssistProcessor;
import org.dslforge.xtext.common.IXtextResourceFactory;
import org.dslforge.xtext.common.IXtextResourceSetProvider;
import org.dslforge.xtext.common.SharedXtextResourceFactory;
import org.dslforge.xtext.common.SharedXtextResourceSetProvider;
import org.dslforge.xtext.common.shared.SharedModule;
import org.eclipse.xtext.example.arithmetics.web.contentassist.ArithmeticsProposalProvider;
import org.eclipse.xtext.example.arithmetics.web.contentassist.antlr.ArithmeticsParser;
import org.eclipse.xtext.example.arithmetics.web.contentassist.antlr.internal.InternalArithmeticsLexer;
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext;
import org.eclipse.xtext.ui.editor.contentassist.LexerUIBindings;
import org.eclipse.xtext.ui.editor.contentassist.XtextContentAssistProcessor;

import com.google.inject.Binder;

public abstract class AbstractWebArithmeticsRuntimeModule extends SharedModule {

	@Override
	public void configure(Binder binder) {
		super.configure(binder);
		binder.bind(org.eclipse.xtext.ui.editor.contentassist.IContentAssistParser.class).to(ArithmeticsParser.class);
		binder.bind(InternalArithmeticsLexer.class).toProvider(org.eclipse.xtext.parser.antlr.LexerProvider.create(InternalArithmeticsLexer.class));
		binder.bind(org.eclipse.xtext.ui.editor.contentassist.antlr.internal.Lexer.class).annotatedWith(com.google.inject.name.Names.named(LexerUIBindings.CONTENT_ASSIST)).to(InternalArithmeticsLexer.class);
		binder.bind(org.eclipse.xtext.ui.editor.contentassist.IContentProposalProvider.class).to(ArithmeticsProposalProvider.class);
		binder.bind(IContentAssistProcessor.class).to(XtextContentAssistProcessor.class);
		binder.bind(ContentAssistContext.Factory.class).to(org.eclipse.xtext.ui.editor.contentassist.ParserBasedContentAssistContextFactory.class);
		binder.bind(org.eclipse.xtext.ui.editor.contentassist.PrefixMatcher.class).to(org.eclipse.xtext.ui.editor.contentassist.PrefixMatcher.IgnoreCase.class);
	}
	
	@Override
	protected void bindResourceSetProvider(Binder binder) {
		binder.bind(IXtextResourceSetProvider.class).to(SharedXtextResourceSetProvider.class);
	}

	@Override
	protected void bindResourceFactory(Binder binder) {
		binder.bind(IXtextResourceFactory.class).to(SharedXtextResourceFactory.class);
	}
}
