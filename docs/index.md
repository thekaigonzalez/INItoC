# INItoC

A INI config to C compiler.

## Backend

INItoC uses the [dINI backend](https://thekaigonzalez.github.io/dINI) to help with conversions.

## Error
For the most part the utility is very quiet, but if the file isn't found or there's no arguments supplied, then there will be some errors.

The errors are self-generated, but if you add the first argument without the second one, there will be D-generated errors.

## Examples

```d

# itc hello.ini hello.h

```

