# hxDVD
Based off of hxCodec, but better

Also, everything is unfinished

## Installation

### Step 1: Editing `Project.xml`
If you have a custom defines section, add the following line:

```xml
<define name="DVD_PLUGIN" if="windows || mac" />
```

Then, add this:

```xml
<haxelib name="hxDVD" if="DVD_PLUGIN"/>
```

### Step 2: Editing your Workflow
Add this to your workflow:

```yml
haxelib install hxDVD
```

Alternatively, use this to install the latest updates:
```yml
haxelib git hxDVD https://github.com/Joalor64GH/hxDVD
```
