#!/bin/sh

osascript -l JavaScript -e "
se = Application('System Events');
dl = se.processes['Dashlane'];
btn = dl.uiElements[0].uiElements[15].uiElements['c'];
btn.click();
"
