# Wiktra

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)]()

Wiktra is a Python package directed at complementing transliteration via Romanization.
  
  - 122 languages (using non-roman orthography)
  - Works in compliance with ISO-639-2

### Setup

As much as you want to use your favorite version of Python, it is recommended to employ 3.5 version on the grounds that the module utilizes lupa-1.8. Lupa enables Python to adopt functionalities of Lua language, in which most of the transliteration modules are written.

The following commands prepare a python environment via Anaconda, which promotes the version and the module dependencies:

First:
```sh
$ conda create -n scr2scr_env python=3.5
```

Second:
```sh
$ conda activate scr2scr_env
```

Start your Python (3.5.x):
```sh
$ python
```
### Example

After placing the package directory inside your project directory or paths subscribed by Python, just run the following:

```sh
from wiktra import translite as tr
```
The package offers only function `translite` and it prompts you to provide two parameters (text, 639-2 code):

```sh
#mongolian script
tr('монгол бичлэг', 'mon')
> mongol bichleg

#hindu script
tr('हिंदी लिपि', 'hin')
> hindee lipi
```

### Todos

 - Make independent of version

License
----

This tool is available under the Creative Commons Attribution-ShareAlike License. Read more about this license from https://creativecommons.org/licenses/by-sa/3.0/.
