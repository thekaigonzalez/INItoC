# INItoC - Export .INI files to C code

INItoC uses [dINI](https://github.com/thekaigonzalez/dINI) as a backend, it converts values to C code as a header (or whatever specified.)

## Examples

hello.ini

```ini
helloworld=hello, world!

```

`itc hello.ini -o hello.h`

hello.h:

```c

const char* helloworld = "hello, world!";

```

## ITC - Command Line reference

itc

Flags:
	-o OUTPUT ...
		Output
Required:
	FILE,
		File to parse

ITC stands for INI to C, it converts .INI configuration files to header files in the C and C++ Programming languages.

