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
package org.dslforge.xtext.generator.web.build

import org.dslforge.common.AbstractGenerator
import org.dslforge.common.IWebProjectFactory
import org.dslforge.xtext.generator.XtextGrammar
import org.eclipse.core.runtime.IProgressMonitor

class GenProduct extends AbstractGenerator {

	var XtextGrammar grammar

	new() {
		relativePath = "/"
		basePath = ""
	}

	override doGenerate(IWebProjectFactory factory, IProgressMonitor monitor) {
		grammar = factory.input as XtextGrammar
		projectName = factory.project.name
		grammarShortName = grammar.getShortName()
		relativePath = "/" + grammarShortName.toLowerCase + "/"
		factory.generateFile(relativePath, projectName.replace(".build", ".product"), toXml(), monitor)
	}

	def toXml() '''
<?xml version="1.0" encoding="UTF-8"?>
<?pde version="3.5"?>

<product name="«grammarShortName.toFirstUpper» Web Editor Product" uid="«projectName.replace(".build", ".product")»" version="1.0.0.qualifier" useFeatures="false" includeLaunchers="false">

   <configIni use="default">
   </configIni>

   <launcherArgs>
      <vmArgs>-DREFRESH_BUNDLES=FALSE
      </vmArgs>
   </launcherArgs>

   <windowImages/>

   <launcher>
      <solaris/>
      <win useIco="false">
         <bmp/>
      </win>
   </launcher>

   <vm>
   </vm>

   <plugins>
      <plugin id="com.google.guava"/>
      <plugin id="com.google.inject"/>
      <plugin id="com.ibm.icu.base"/>
      <plugin id="javax.activation"/>
      <plugin id="javax.inject"/>
      <plugin id="javax.mail"/>
      <plugin id="javax.persistence"/>
      <plugin id="javax.xml"/>
      <plugin id="org.antlr.runtime"/>
      <plugin id="org.apache.commons.cli"/>
      <plugin id="org.apache.commons.lang"/>
      <plugin id="org.apache.commons.logging"/>
      <plugin id="org.apache.felix.gogo.command"/>
      <plugin id="org.apache.felix.gogo.runtime"/>
      <plugin id="org.apache.felix.gogo.shell"/>
      <plugin id="org.apache.log4j"/>
      <plugin id="org.dslforge.common.logging" fragment="true"/>
      <plugin id="org.dslforge.styledtext"/>
      <plugin id="org.dslforge.texteditor"/>
      <plugin id="org.dslforge.texteditor.demo"/>
      <plugin id="org.dslforge.workspace"/>
      <plugin id="org.dslforge.workspace.ui"/>
      <plugin id="org.dslforge.xtext.common"/>
      <plugin id="org.eclipse.core.commands"/>
      <plugin id="org.eclipse.core.contenttype"/>
      <plugin id="org.eclipse.core.databinding"/>
      <plugin id="org.eclipse.core.databinding.beans"/>
      <plugin id="org.eclipse.core.databinding.observable"/>
      <plugin id="org.eclipse.core.databinding.property"/>
      <plugin id="org.eclipse.core.expressions"/>
      <plugin id="org.eclipse.core.jobs"/>
      <plugin id="org.eclipse.core.runtime"/>
      <plugin id="org.eclipse.emf.common"/>
      <plugin id="org.eclipse.emf.ecore"/>
      <plugin id="org.eclipse.emf.ecore.xmi"/>
      <plugin id="org.eclipse.emf.edit"/>
      <plugin id="org.eclipse.emf.rap.common.ui"/>
      <plugin id="org.eclipse.emf.rap.edit.ui"/>
      <plugin id="org.eclipse.equinox.app"/>
      <plugin id="org.eclipse.equinox.common"/>
      <plugin id="org.eclipse.equinox.console"/>
      <plugin id="org.eclipse.equinox.http.registry"/>
      <plugin id="org.eclipse.equinox.http.servlet"/>
      <plugin id="org.eclipse.equinox.http.servletbridge"/>
      <plugin id="org.eclipse.equinox.preferences"/>
      <plugin id="org.eclipse.equinox.registry"/>
      <plugin id="org.eclipse.equinox.servletbridge"/>
      <plugin id="org.eclipse.gemini.jpa"/>
      <plugin id="org.eclipse.help"/>
      <plugin id="org.eclipse.osgi"/>
      <plugin id="org.eclipse.osgi.services"/>
      <plugin id="org.eclipse.persistence.antlr"/>
      <plugin id="org.eclipse.persistence.asm"/>
      <plugin id="org.eclipse.persistence.core"/>
      <plugin id="org.eclipse.persistence.jpa"/>
      <plugin id="org.eclipse.persistence.jpa.jpql"/>
      <plugin id="org.eclipse.rap.jface"/>
      <plugin id="org.eclipse.rap.jface.databinding"/>
      <plugin id="org.eclipse.rap.rwt"/>
      <plugin id="org.eclipse.rap.rwt.osgi"/>
      <plugin id="org.eclipse.rap.ui"/>
      <plugin id="org.eclipse.rap.ui.navigator"/>
      <plugin id="org.eclipse.rap.ui.views"/>
      <plugin id="org.eclipse.rap.ui.workbench"/>
      <plugin id="org.eclipse.xtend.lib"/>
      <plugin id="org.eclipse.xtend.lib.macro"/>
      <plugin id="org.eclipse.xtext"/>
      <plugin id="org.eclipse.xtext.common.types"/>
      <plugin id="«projectName.replace(".web.build", "")»"/>
      <plugin id="«projectName.replace(".build", "")»"/>
      <plugin id="org.eclipse.xtext.smap"/>
      <plugin id="org.eclipse.xtext.util"/>
      <plugin id="org.eclipse.xtext.xbase.lib"/>
      <plugin id="org.hamcrest.core"/>
      <plugin id="org.objectweb.asm"/>
      <plugin id="osgi.enterprise"/>
   </plugins>

   <configurations>
      <plugin id="com.google.guava" autoStart="true" startLevel="0" />
      <plugin id="com.google.inject" autoStart="true" startLevel="0" />
      <plugin id="com.ibm.icu.base" autoStart="true" startLevel="0" />
      <plugin id="javax.activation" autoStart="true" startLevel="0" />
      <plugin id="javax.inject" autoStart="true" startLevel="0" />
      <plugin id="javax.mail" autoStart="true" startLevel="0" />
      <plugin id="javax.persistence" autoStart="true" startLevel="0" />
      <plugin id="javax.xml" autoStart="true" startLevel="0" />
      <plugin id="org.antlr.runtime" autoStart="true" startLevel="0" />
      <plugin id="org.apache.commons.cli" autoStart="true" startLevel="0" />
      <plugin id="org.apache.commons.lang" autoStart="true" startLevel="0" />
      <plugin id="org.apache.commons.logging" autoStart="true" startLevel="0" />
      <plugin id="org.apache.felix.gogo.command" autoStart="true" startLevel="0" />
      <plugin id="org.apache.felix.gogo.runtime" autoStart="true" startLevel="0" />
      <plugin id="org.apache.felix.gogo.shell" autoStart="true" startLevel="0" />
      <plugin id="org.apache.log4j" autoStart="true" startLevel="0" />
      <plugin id="org.dslforge.styledtext" autoStart="true" startLevel="4" />
      <plugin id="org.dslforge.texteditor" autoStart="true" startLevel="4" />
      <plugin id="org.dslforge.texteditor.demo" autoStart="true" startLevel="4" />
      <plugin id="org.dslforge.workspace" autoStart="true" startLevel="3" />
      <plugin id="org.dslforge.workspace.ui" autoStart="true" startLevel="4" />
      <plugin id="org.dslforge.xtext.common" autoStart="true" startLevel="4" />
      <plugin id="org.eclipse.core.commands" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.contenttype" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.databinding" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.databinding.beans" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.databinding.observable" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.databinding.property" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.expressions" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.jobs" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.core.runtime" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.emf.common" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.emf.ecore" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.emf.ecore.xmi" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.emf.edit" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.emf.rap.common.ui" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.emf.rap.edit.ui" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.app" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.common" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.console" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.http.registry" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.http.servlet" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.http.servletbridge" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.preferences" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.registry" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.equinox.servletbridge" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.gemini.jpa" autoStart="true" startLevel="2" />
      <plugin id="org.eclipse.help" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.osgi" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.osgi.services" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.persistence.antlr" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.persistence.asm" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.persistence.core" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.persistence.jpa" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.persistence.jpa.jpql" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.jface" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.jface.databinding" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.rwt" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.rwt.osgi" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.ui" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.ui.navigator" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.ui.views" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.rap.ui.workbench" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.xtend.lib" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.xtend.lib.macro" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.xtend.typesystem.emf" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.xtext" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.xtext.common.types" autoStart="true" startLevel="0" />
      <plugin id="«projectName.replace(".web.build", "")»" autoStart="true" startLevel="4" />
      <plugin id="«projectName.replace(".build", "")»" autoStart="true" startLevel="4" />
      <plugin id="org.eclipse.xtext.util" autoStart="true" startLevel="0" />
      <plugin id="org.eclipse.xtext.xbase.lib" autoStart="true" startLevel="0" />
      <plugin id="org.hamcrest.core" autoStart="true" startLevel="0" />
      <plugin id="org.objectweb.asm" autoStart="true" startLevel="0" />
      <plugin id="osgi.enterprise" autoStart="true" startLevel="1" />
   </configurations>

   <preferencesInfo>
      <targetfile overwrite="false"/>
   </preferencesInfo>

   <cssInfo>
   </cssInfo>

</product>
	'''
}
