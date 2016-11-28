EXTRA_DIST = $(doxygen_input) $(static_pages)

doxygen_input = 
static_pages = 


# DOC is defined if installer requests doc generation.
# For now, we only install HTML documentation.  We could install manpages
# using the following
#   man_MANS = man/man3/CppUnit.3
#   man/man3/CppUnit.3: dox
# and an extra copy or two in the install-data-hook.
# However, the manpages do not appear to be tremendously useful, so
# let's not bother.

if DOC

htmldir = $(pkgdatadir)/html
html_DATA = $(static_pages) html/index.html

install-data-hook:
	cp -pR html/* $(DESTDIR)$(htmldir)

# Automake's "distcheck" is sensitive to having files left over
# after "make uninstall", so we have to clean up the install hook.
uninstall-local:
	rm -rf $(DESTDIR)$(htmldir)

dox: html/index.html

else

# We repeat the three targets in both the "if" and "else" clauses
# of the conditional, because the generated makefile will contain
# references to the targets (target "install" depends on target
# "install-datahook", for example), and some make programs get upset
# if no target exists.

install-data-hook:
uninstall-local:
dox:

endif


all-local: dox


html/index.html: Doxyfile $(doxygen_input)
	"@DOXYGEN@"


# Make tarfile to distribute the HTML documentation.
doc-dist: dox
	tar -czf $(PACKAGE)-docs-$(VERSION).tar.gz -C html .


clean-local:
	$(RM) -r html 
