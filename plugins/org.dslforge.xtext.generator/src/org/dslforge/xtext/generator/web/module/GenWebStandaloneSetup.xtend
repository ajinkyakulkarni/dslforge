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
package org.dslforge.xtext.generator.web.module

import org.dslforge.xtext.generator.IWebProjectGenerator
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.Grammar
import org.dslforge.xtext.generator.util.GeneratorUtil

class GenWebStandaloneSetup implements IWebProjectGenerator{
	
	val relativePath = "/module/"
	var String grammarShortName
	var Grammar grammar
	var String projectName
	
	override doGenerate(EObject input, IFileSystemAccess fsa) {
		grammar = input as Grammar
		var basePath=GeneratorUtil::getBasePath(grammar)
		projectName=GeneratorUtil::getProjectName(grammar)
		grammarShortName= GeneratorUtil::getGrammarShortName(grammar)
		fsa.generateFile(basePath + relativePath + "Web" + grammarShortName.toFirstUpper + "StandaloneSetup" + ".java", "src", toJava())
	}

	def toJava()'''
package «projectName».module;

import org.eclipse.xtext.util.Modules2;
import «grammar.name»RuntimeModule;
import «grammar.name»StandaloneSetup;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;

public class Web«grammarShortName.toFirstUpper»StandaloneSetup extends «grammarShortName.toFirstUpper»StandaloneSetup {

	public static void doSetup() {
		new «grammarShortName.toFirstUpper»StandaloneSetup().createInjectorAndDoEMFRegistration();
	}

	public Injector createInjector(String language) {
		try {
			Module runtimeModule = getRuntimeModule();
			Injector injector = Guice.createInjector(runtimeModule);
			register(injector);
			return injector;
		} catch (Exception e) {
			System.err.println("Failed to create injector for " + language);
			throw new RuntimeException("Failed to create injector for "
					+ language, e);
		}
	}

	private Module getRuntimeModule() {
		org.eclipse.xtext.common.TerminalsStandaloneSetup.doSetup();
		«grammarShortName.toFirstUpper»RuntimeModule original = new «grammarShortName.toFirstUpper»RuntimeModule();
		Web«grammarShortName.toFirstUpper»RuntimeModule module = new Web«grammarShortName.toFirstUpper»RuntimeModule();
		Module mergedModule = Modules2.mixin((Module) original, module);
		return mergedModule;
	}
}
	'''
		
	override doGenerate(Resource input, IFileSystemAccess fsa) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}