#
# 
#
# Copyright (C) 1997-2013 by Dimitri van Heesch.
#
# Permission to use, copy, modify, and distribute this software and its
# documentation under the terms of the GNU General Public License is hereby 
# granted. No representations are made about the suitability of this software 
# for any purpose. It is provided "as is" without express or implied warranty.
# See the GNU General Public License for more details.
#
# Documents produced by Doxygen are derivative works derived from the
# input used in their production; they are not affected by this license.
#!
#! doxygen.t: This is a custom template for building Doxygen
#!
#$ IncludeTemplate("lib.t");

LEX        = /usr/bin/flex
YACC       = /usr/bin/bison
INCBUFSIZE = $(PERL) increasebuffer.pl

#${
sub GenerateDep {
    my($obj,$src,$dep) = @_;
    my(@objv,$srcv,$i,$s,$o,$d,$c);
    @objv = split(/\s+/,$obj);
    @srcv = split(/\s+/,$src);
    for $i ( 0..$#objv ) {
        $s = $srcv[$i];
        $o = $objv[$i];
        next if $s eq "";
        $text .= $o . ": " . $s;
	$text .= " ${linebreak}\n\t\t" . $dep if $dep ne "";
        if ( $moc_output{$s} ne "" ) {
            $text .= " ${linebreak}\n\t\t" . $moc_output{$s};
        }
        $d = &make_depend($s);
        $text .= " ${linebreak}\n\t\t" . $d if $d ne "";
	$text .= "\n";
    }
    chop $text;
}
#$} 

####################

#$ GenerateDep("scanner.cpp","scanner.l");
	$(LEX) -PscanYY -t scanner.l | $(INCBUFSIZE) >scanner.cpp

#$ GenerateDep("code.cpp","code.l");
	$(LEX) -PcodeYY -t code.l | $(INCBUFSIZE) >code.cpp

#$ GenerateDep("pyscanner.cpp","pyscanner.l");
	$(LEX) -PpyscanYY -t pyscanner.l | $(INCBUFSIZE) >pyscanner.cpp

#$ GenerateDep("pycode.cpp","pycode.l");
	$(LEX) -PpycodeYY -t pycode.l | $(INCBUFSIZE) >pycode.cpp

#$ GenerateDep("fortranscanner.cpp","fortranscanner.l");
	$(LEX) -i -PfscanYY -t fortranscanner.l | $(INCBUFSIZE) >fortranscanner.cpp

#$ GenerateDep("fortrancode.cpp","fortrancode.l");
	$(LEX) -i -PfcodeYY -t fortrancode.l | $(INCBUFSIZE) >fortrancode.cpp

#$ GenerateDep("vhdlcode.cpp","vhdlcode.l");
	$(LEX) -i -PvhdlcodeYY -t vhdlcode.l | $(INCBUFSIZE) >vhdlcode.cpp

#$ GenerateDep("tclscanner.cpp","tclscanner.l");
	$(LEX) -i -PtclscanYY -t tclscanner.l | $(INCBUFSIZE) >tclscanner.cpp

#$ GenerateDep("pre.cpp","pre.l");
	$(LEX) -PpreYY -t pre.l | $(INCBUFSIZE) >pre.cpp 

#$ GenerateDep("declinfo.cpp","declinfo.l");
	$(LEX) -PdeclinfoYY -t declinfo.l | $(INCBUFSIZE) >declinfo.cpp

#$ GenerateDep("defargs.cpp","defargs.l");
	$(LEX) -PdefargsYY -t defargs.l | $(INCBUFSIZE) >defargs.cpp

#$ GenerateDep("doctokenizer.cpp","doctokenizer.l");
	$(LEX) -PdoctokenizerYY -t doctokenizer.l | $(INCBUFSIZE) >doctokenizer.cpp

#$ GenerateDep("commentcnv.cpp","commentcnv.l");
	$(LEX) -PcommentcnvYY -t commentcnv.l | $(INCBUFSIZE) >commentcnv.cpp

#$ GenerateDep("commentscan.cpp","commentscan.l");
	$(LEX) -PcommentScanYY -t commentscan.l | $(INCBUFSIZE) >commentscan.cpp

#$ GenerateDep("ce_lex.cpp","constexp.l","ce_parse.h");
	$(LEX) -PcppExpYY -t constexp.l | $(INCBUFSIZE) >ce_lex.cpp 

#$ GenerateDep("ce_parse.cpp","constexp.y");
	$(YACC) -l -p cppExpYY constexp.y -o ce_parse.cpp 

#$ GenerateDep("ce_parse.h","constexp.y");
	$(YACC) -l -d -p cppExpYY constexp.y -o ce_parse.c 
	-rm ce_parse.c

#$ GenerateDep("vhdlscanner.cpp","vhdlscanner.l","vhdlparser.h");
	$(LEX) -i -PvhdlScanYY -t vhdlscanner.l | $(INCBUFSIZE) >vhdlscanner.cpp

#$ GenerateDep("vhdlparser.cpp","vhdlparser.y");
	$(YACC) -l -p vhdlScanYY vhdlparser.y -o vhdlparser.cpp 	

#$ GenerateDep("vhdlparser.h","vhdlparser.y");
	$(YACC) -l -d -p vhdlScanYY vhdlparser.y -o vhdlparser.c 
	-rm vhdlparser.c	
	
#$ GenerateDep("layout.cpp","layout_default.h");

TO_C_CMD=sed -e "s/\\\\/\\\\\\\\/g" -e "s/\"/\\\\\"/g" -e "s/^/\"/g" -e "s/$$/\\\\n\"/g"

index_xsd.h: index.xsd
	cat index.xsd | $(TO_C_CMD) >index_xsd.h 

compound_xsd.h: compound.xsd
	cat compound.xsd | $(TO_C_CMD) >compound_xsd.h 

layout_default.h: layout_default.xml
	cat layout_default.xml | $(TO_C_CMD) >layout_default.h 

header_html.h: header.html
	cat header.html | $(TO_C_CMD) >header_html.h

footer_html.h: footer.html
	cat footer.html | $(TO_C_CMD) >footer_html.h

search_functions_php.h: search_functions.php
	cat search_functions.php | $(TO_C_CMD) >search_functions_php.h 

search_opensearch_php.h: search_opensearch.php
	cat search_opensearch.php | $(TO_C_CMD) >search_opensearch_php.h 

search_js.h: search.js
	cat search.js | $(TO_C_CMD) >search_js.h 

search_css.h: search.css
	cat search.css | $(TO_C_CMD) >search_css.h 

extsearch_js.h: extsearch.js
	cat extsearch.js | $(TO_C_CMD) >extsearch_js.h 

doxygen_css.h: doxygen.css
	cat doxygen.css | $(TO_C_CMD) >doxygen_css.h 

doxygen_sty.h: doxygen.sty
	cat doxygen.sty | $(TO_C_CMD) >doxygen_sty.h 

navtree_js.h: navtree.js
	cat navtree.js | $(TO_C_CMD) >navtree_js.h

navindex_js.h: navindex.js
	cat navindex.js | $(TO_C_CMD) >navindex_js.h

resize_js.h: resize.js
	cat resize.js | $(TO_C_CMD) >resize_js.h

jquery_p1_js.h: jquery_p1.js
	cat jquery_p1.js | $(TO_C_CMD) >jquery_p1_js.h

jquery_p2_js.h: jquery_p2.js
	cat jquery_p2.js | $(TO_C_CMD) >jquery_p2_js.h

jquery_p3_js.h: jquery_p3.js
	cat jquery_p3.js | $(TO_C_CMD) >jquery_p3_js.h

jquery_p4_js.h: jquery_p4.js
	cat jquery_p4.js | $(TO_C_CMD) >jquery_p4_js.h

jquery_ui_js.h: jquery_ui.js
	cat jquery_ui.js | $(TO_C_CMD) >jquery_ui_js.h

jquery_fx_js.h: jquery_fx.js
	cat jquery_fx.js | $(TO_C_CMD) >jquery_fx_js.h

jquery_pt_js.h: jquery_pt.js
	cat jquery_pt.js | $(TO_C_CMD) >jquery_pt_js.h

navtree_css.h: navtree.css
	cat navtree.css | $(TO_C_CMD) >navtree_css.h

svgpan_js.h: svgpan.js
	cat svgpan.js | $(TO_C_CMD) >svgpan_js.h

dynsections_js.h: dynsections.js
	cat dynsections.js | $(TO_C_CMD) >dynsections_js.h

doxygen_bst.h: doxygen.bst
	cat doxygen.bst | $(TO_C_CMD) >doxygen_bst.h

bib2xhtml.h: bib2xhtml.pl
	cat bib2xhtml.pl | $(TO_C_CMD) >bib2xhtml.h


