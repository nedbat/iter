SLIDE_HTML = iter.html

SUPPORT = lineselect.js

.PHONY: $(SLIDE_HTML)

slides: $(SLIDE_HTML)

PNG_DIR = png

clean:
	rm -f *.pyc $(PX)
	rm -rf __pycache__
	rm -rf $(PNG_DIR)

pngs:
	\\app\\phantomjs-1.3.0-win32-dynamic\\phantomjs.exe phantom-slippy-to-png.js $(SLIDE_HTML) $(PNG_DIR)/

PX = iter.px

px $(PX): $(SLIDE_HTML)
	python slippy_to_px.py $(SLIDE_HTML) $(PX)

WEBHOME = c:/ned/web/stellated/pages/text
WEBPREZHOME = $(WEBHOME)/iter

publish: $(PX) pngs
	cp -f $(PX) $(WEBHOME)
	cp -f $(PNG_DIR)/* $(WEBHOME)
	cp -f $(SLIDE_HTML) $(SUPPORT) $(WEBPREZHOME)
	cp -rf slippy $(WEBPREZHOME)
	cp -rf highlight $(WEBPREZHOME)
