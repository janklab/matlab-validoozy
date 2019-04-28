Validatentine for Matlab
========================

Additional validator functions for Matlab.

Validatentine provides additional `mustBe*()` validator functions for Matlab.
These are the input/property-validation functions introduced in Matlab R2017a.

Validatentine provides two sets of validator functions:

* `extend` – New validator functions that Matlab does not define
* `compat` – Back-compatibility implementations of the Matlab-provided validators, for use in Matlab versions prior to R2017a, or if you want to use my "label" extension

## Usage

To use Validatentine, install the source tree somewhere on your disk, and then:

  * Add its `Mcode/extend` directory to your Matlab path
  * Add its `Mcode/compat` directory to your Matlab path if you are running Matlab R2016b or earlier

## Label extension

My validator functions provide an additional optional "`label`" argument that allows you to specify how the error message refers to the input upon validation failure.
This is useful if you are calling the validator on something besides a named variable, such as a field of a struct, or a value in a cell array.
In these cases, the validator functions are unable to automatically detect a good label via the use of `inputname`, so you can supply one manually to produce a nicer error message.

Both the "extend" and "compat" implementations in Validatentine support label arguments.
If you want to use my label extension with Matlab-defined functions in R2017a and later, stick the `Mcode/compat` directory on the front of your Matlab path, and I _think_ it will work.
I've defined all the "compat" functions to be compatible with Matlab's own implementations, for the signature forms that they define.

## License

Validatentine for Matlab is licensed under the business-friendly BSD 2-clause license.

## Project

The home page for Validatentine for Matlab is the [Validatentine GitHub repo](https://github.com/apjanke/matlab-validatentine).

For support, feel free to post a bug report or question on the [Validatentine GitHub issue tracker](https://github.com/apjanke/matlab-validatentine/issues).

The project author is [Andrew Janke](https://apjanke.net).
