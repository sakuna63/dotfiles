#!/bin/sh

osascript -l JavaScript -e "
se = Application('System Events');
dl = se.processes['Dashlane'];
app = Application.currentApplication();
app.includeStandardAdditions = true;
// dl.uiElements[0].uiElements[18].uiElements[0].uiElements[3].uiElements[0].uiElements().forEach(function(elem, i) {
//   console.log(elem.name());
//   console.log(elem.position());
//   console.log(elem.uiElements().length);
//   console.log(i);
  // console.log(elem.name());
  // elem.uiElements().forEach(function(e, l) {
  //   console.log(e.name());
  //   console.log(e.position());
  //   console.log(l);
  //   e.uiElements().forEach(function(e2, l2) {
  //     console.log(e2.name());
  //     console.log(e2.position());
  //     console.log(l2);
  //   })
  // })
// });
//

// move mouse focus on password row
pos = dl.uiElements[0].uiElements[18].uiElements[0].uiElements[3].uiElements[0].uiElements[1].position();
app.doShellScript('/usr/local/bin/cliclick m:' + pos[0] + ',' + pos[1]);

// copy password
btn = dl.uiElements[0].uiElements[18].uiElements[0].uiElements[3].uiElements[0].uiElements['コピー'];
btn.click();
"
