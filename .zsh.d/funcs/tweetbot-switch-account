#!/bin/sh

echo "
se = Application('System Events');
tb = se.processes.byName('Tweetbot');
app = Application.currentApplication();
app.includeStandardAdditions = true;
tb.frontmost = true;

[x, y] = tb.uiElements['New Tweet'].uiElements[4].uiElements[0].position().map(function(elem, idx, array){ return Number(elem)  });
x += 25;
y += 25;
now_pos = app.doShellScript('/usr/local/bin/cliclick p:.').split(': ')[1];
app.doShellScript('/usr/local/bin/cliclick c:' + x + ',' + y);
app.doShellScript('/usr/local/bin/cliclick m:' + now_pos);
for (i = 0; i < $1; i++){
  se.keyCode(125); // down arrow
}
se.keyCode(36);  // enter
" | osascript -l JavaScript -
