# Summary - Large Scale Convex Optimization

## Filestructure

### main file

`lsco.tex` links the lecture, recital and summary chapters together

- uses toggles to display desired section, is set to display summary

- choose template at the beginning of the file

**Template for Summary** in landscape format by default

```tex
\documentclass[layout=tight, columns=4,secnumdepth=1]{sst-custom}
```

(Text size not automatic so far)

**Recommendation** for working at the computer:

```tex
\documentclass[layout=preview,secnumdepth=1]{sst-custom}
```

(One column just with vertical scrolling)

### config file

`sst-custom.cls` includes most of the settings, depending on the layout

- Automatic spacing partial available for tight layout but not optimal
