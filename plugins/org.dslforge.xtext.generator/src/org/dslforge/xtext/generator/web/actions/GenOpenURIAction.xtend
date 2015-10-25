/**
 * <copyright>
 *
 * Copyright (c) 2015 PlugBee. All rights reserved.
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
package org.dslforge.xtext.generator.web.actions

import org.dslforge.xtext.generator.IWebProjectGenerator
import org.dslforge.xtext.generator.util.GeneratorUtil
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.Grammar
import org.eclipse.xtext.generator.IFileSystemAccess

class GenOpenURIAction implements IWebProjectGenerator{
	
	val relativePath = "/actions/"
	var String projectName
	var String grammarShortName
	var String basePath
	
	override doGenerate(EObject input, IFileSystemAccess fsa) {
		var grammar = input as Grammar
		projectName=GeneratorUtil::getProjectName(grammar)
		grammarShortName= GeneratorUtil::getGrammarShortName(grammar)
		basePath=GeneratorUtil::getBasePath(grammar)
		fsa.generateFile(basePath + relativePath + "OpenURIAction.java", "src", toJava())
	}
	
	def toJava()'''
package «projectName».actions;

import org.dslforge.rap.workspace.WorkspaceManager;
import org.eclipse.emf.common.ui.URIEditorInput;
import org.eclipse.emf.common.ui.action.WorkbenchWindowActionDelegate;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.edit.ui.action.LoadResourceAction;
import org.eclipse.emf.edit.ui.util.EditUIUtil;
import org.eclipse.jface.action.IAction;
import org.eclipse.jface.dialogs.MessageDialog;
import org.eclipse.jface.window.Window;
import org.eclipse.ui.IEditorDescriptor;
import org.eclipse.ui.IWorkbench;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.PartInitException;

public class OpenURIAction extends WorkbenchWindowActionDelegate {

	//@Override
	public void run(IAction action) {
		LoadResourceAction.LoadResourceDialog loadResourceDialog = new LoadResourceAction.LoadResourceDialog(getWindow().getShell());
		if (Window.OK == loadResourceDialog.open()) {
			String baseURI = WorkspaceManager.getInstance().getWorkspaceRoot();
			for (URI uri : loadResourceDialog.getURIs()) {
				URI absoluteURI = URI.createFileURI(baseURI + "/" + uri.path());
				openEditor(getWindow().getWorkbench(), absoluteURI);
			}
		}
	}

	public static boolean openEditor(IWorkbench workbench, URI uri) {
		IWorkbenchWindow workbenchWindow = workbench.getActiveWorkbenchWindow();
		IWorkbenchPage page = workbenchWindow.getActivePage();
		
		IEditorDescriptor editorDescriptor = EditUIUtil.getDefaultEditor(uri, null);
		if (editorDescriptor == null) {
			MessageDialog.openError(workbenchWindow.getShell()
				,"Error"
				,"There is no editor registered for the file " + uri.lastSegment());
			return false;
		}
		else {
			try {
				page.openEditor(new URIEditorInput(uri), editorDescriptor.getId());
			}
			catch (PartInitException exception) {
				MessageDialog.openError(
					workbenchWindow.getShell()
					,"Open Editor"
					,exception.getMessage());
				return false;
			}
		}
		return true;
	}
}
	'''

	override doGenerate(Resource input, IFileSystemAccess fsa) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}