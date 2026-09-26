This is valid browser configuration for any **mozilla firefox** based fork e.g. **librewolf, ironfox, waterfox**.

On first run the browser will automatically enforce all *policies.json* entries. The file must be named *policies.json*!

*mf-policies.json* is not a valid file and must be renamed to *policies.json* for using it. The file must be in the browser specific
installation folder, this is different for every system -> read the documentation on this.

Typical Pathes:
- Windows: C:\Program Files\Mozilla Firefox\distribution\policies.json
- Linux: /etc/firefox/policies/policies.json
- macOS: /Applications/Firefox.app/Contents/Resources/distribution/policies.json

---

- *policies.json*: meant for browsers that come with ublock origin installed by default e.g. **librewolf**
- *mf-policies.json*: meant for browsers that do not come with ublock origin by default e.g. **mozilla firefox and most others**

All other files are addon configuration files

Important: The policies.json file is a firefox (gecko) configuration feature and does not work with chrome (chromium) based browsers.
Some firefox forks might also not support the firefox base features, although librewolf does.
