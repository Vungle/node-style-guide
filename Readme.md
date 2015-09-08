# Vungle JavaScript Style Guide

This is a guide for writing consistent and aesthetically pleasing JavaScript
code in Vungle repositories. The majority of the style selections are what's
popular in the wide JavaScript community with major influences from
[Felix's Node Style Guide](https://github.com/felixge/node-style-guide),
[Google's JS Style Guide](https://google.github.io/styleguide/javascriptguide.xml)
and some of Vungle's own conventions.

This `Readme.md` file verbally explains the rules. There is a `.jshintrc` which
enforces these rules as closely as possible. You can either use that and adjust
it, or use
[this script](https://gist.github.com/kentcdodds/11293570) to make your own.

This guide is licensed under the
[CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/)
license. You are encouraged to fork this repository and make adjustments
according to your preferences.

![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)

## Table of contents

* [Code Formatting](#code-formatting)
  * [80 characters per line](#80-characters-per-line)
  * [Indentions](#indentions)
  * [Newlines](#newlines)
  * [No trailing whitespace](#no-trailing-whitespace)
  * [Use Semicolons](#use-semicolons)
  * [Use single quotes](#use-single-quotes)
  * [Opening braces go on the same line](#opening-braces-go-on-the-same-line)
  * [Alphabetize dependencies](#alphabetize-dependencies)
* [Declare one variable per var statement](#declare-one-variable-per-var-statement)
* [Declare classes](#declare-classes)
* [Naming Conventions](#naming-conventions)
  * [Use lowerCamelCase for variables, properties and function names](#use-lowercamelcase-for-variables-properties-and-function-names)
  * [Use UpperCamelCase for class names](#use-uppercamelcase-for-class-names)
  * [Use UPPERCASE for Constants](#use-uppercase-for-constants)
* [Use the === operator](#use-the--operator)
* [Use multi-line ternary operator](#use-multi-line-ternary-operator)
* [Do not use associative Array](#do-not-use-associative-array)
* [Array and Object literals](#array-and-object-literals)
* [Multi-line string literals](#multi-line-string-literals)
* [Writing Comments](#writing-comments)
* [Object.freeze, Object.preventExtensions, Object.seal, with, eval](#objectfreeze-objectpreventextensions-objectseal-with-eval)
* [Avoid delete](#avoid-delete)


## Code Formatting

In general, we will follow [Google's code formatting guide][googleformatting].

[googleformatting]: https://google.github.io/styleguide/javascriptguide.xml?showone=Code_formatting#Code_formatting

### 80 characters per line

Limit your lines to 80 characters wide. Except the following exceptions:

- URL in comments;

- Regular expression created using `/` notation; *(Such occurrences should be
  declared as constants near the beginning of the file.)*

-  Script dependencies, such as `require()`; *(Such occurrences should be
  declared as constants near the beginning of the file.)*

### Indentions

Use **two** spaces for indenting your code; wrapped lines should be indented  
either left-aligned to a sibling expression above, or **four** spaces (not
**two** spaces) deeper than a parent expression (where "sibling" and "parent"
refer to parenthesis nesting level).

*Right:*

```js
var someCrazyLibrary = require('../that/crazy/library/path/we/have/to/deal/with/can/exceed/line/limit');

var SOME_CRAZY_REGEX = /abcdefg?ABCDEFG?OMG[0-9]+way(too|to)?crazy\/can\Wbe\Won\Wsame\Wline/g;

/**
 * Comments that include URL's like this,
 * http://superlong.url.i.am.very.tired.of/some/path/some?query=param&more=stuff&is=ok-to-be-in-one-line
 */
function someFunc() {
  this.statement = 'is indented two spaces';
  andItIsCool();

  some.superLong.statement = thatNeedsToBe(wrapped, willHaveToBe(indented,
      fourSpacesOnTheFollowingline(
          withSomeArg,
          someMoreArg,
          because,
          oneArgPerLine,
          inThisCase,
          isFine)));

  alternatively(indent(),
                like(),
                thisMethod());
}

var arrayLiteral = [
  'does',
  'not',
  'need',
  'to',
  'indent',
  'four',
  'spaces'
];

var objectLiteral = {
  does: 'not',
  need: 'to',
  indent: 'four',
  spaces: 'cool!'
};
```

*Wrong:*

```js
function doSomething() {
youShouldKnow()
.code(shouldNot(
lookLike,
this
));
}

require('something/that/is/very/long/should/be/moved/to/the/beginning/of/the/file');
```

### Newlines

Use UNIX-style newlines (`\n`), and a newline character as the last character
of a file. Windows-style newlines (`\r\n`) are forbidden inside any repository.

### No trailing whitespace

Just like you brush your teeth after every meal, you clean up any trailing
whitespace in your JS files before committing. Otherwise the rotten smell of
careless neglect will eventually drive away contributors and/or co-workers.

### Use Semicolons

According to [scientific research][hnsemicolons], the usage of semicolons is
a core value of our community. Consider the points of [the opposition][], but
be a traditionalist when it comes to abusing error correction mechanisms for
cheap syntactic pleasures.

#### Do not append semicolons after function unless declared with var
*Right*
```js
function myFunc() {
} // No semi colon.

var myFunc = function() {
}; // Semicolon here.
```

*Wrong*
```js
function myFunc() {
};

var myFunc = function() {
}
```

[the opposition]: http://blog.izs.me/post/2353458699/an-open-letter-to-javascript-leaders-regarding
[hnsemicolons]: http://news.ycombinator.com/item?id=1547647

### Use single quotes

Use single quotes, unless you are writing JSON.

*Right:*

```js
var foo = 'bar';
```

*Wrong:*

```js
var foo = "bar";
```

### Opening braces go on the same line

Your opening braces go on the same line as the statement.

*Right:*

```js
if (true) {
  console.log('winning');
}
```

*Wrong:*

```js
if (true)
{
  console.log('losing');
}
```

#### Newline character after open braces

Always insert a line break following the open brace `{` character, except for
object literals or immediately closed brace `}` character.

*Right:*

```js
function emptyFunc() {}

function trivialFunc() {
  return false;
}

if (trivialBoolean) {
  return false;
} else {
  doSomething();
}

var obj = {'a': 1, 'b': 2};
```

*Wrong:*

```js
function trivialFunc() { return false; }

if (trivialBoolean) {  return false; }
```

### Alphabetize dependencies

When including dependencies in the code, they should be generally included
towards the beginning of the file alphabetized first by the globally visible
package name (*aka npm package name*) then the paths to the file.

There should be a blank line between globally visible dependencies and the local
dependencies.

It's recommended to name the dependencies the same as their package name.

*Right:*

```js
// First include globally visible packages.
var bunyan = require('bunyan');
var fs = require('fs');
var redis = require('redis');

// Then include locally created packages. Note the blank line above.
var albatross = require('./lib/albatross');
var openRtbValidator = require('./lib/openrtb/validator');
```

*Wrong:*
```js
var fs = require('fs');
var myBunyan = require('bunyan'); // 'bunyan' package should come before 'fs'.
// There should be a blank line here.
var albatross = require('./lib/albatross');
var redis = require('redis'); // Globally visible package first.
```

## Declare one variable per var statement

Declare one variable per var statement, it makes it easier to re-order the
lines. However, ignore [Crockford][crockfordconvention] when it comes to
declaring variables deeper inside a function, just put the declarations wherever
they make sense.

*Right:*

```js
var keys   = ['foo', 'bar'];
var values = [23, 42];

var object = {};
while (keys.length) {
  var key = keys.pop();
  object[key] = values.pop();
}
```

*Wrong:*

```js
var keys = ['foo', 'bar'],
    values = [23, 42],
    object = {},
    key;

while (keys.length) {
  key = keys.pop();
  object[key] = values.pop();
}
```

[crockfordconvention]: http://javascript.crockford.com/code.html

## Declare Classes

Declare a class using the `@constructor` jsdoc annotation. Like,

```js
/**
 * @constructor
 */
function SomeClass() {}
```

While there are several ways to attach methods and properties to an object
created via `new`, the preferred style for methods is:

```js
SomeClass.prototype.someMethod = function() {
  /* ... */
};
```

The preferred style for other properties is to initialize the field in the
constructor:

```js
/** @constructor */
function SomeClass() {
  this.someProperty = 'someDefaultValue';
}
```

NEVER extend class methods or properties on the instance.

*Wrong:*
```js
/** @constructor */
function SomeClass() {}

var someInstance = new SomeClass();
someInstance.newProperty = 1;
someInstance.newMethod = function() {
  return 'I cannot do this!';
};
```

**Why?**
Current JavaScript engines optimize based on the "shape" of an object, adding a
property to an object (including overriding a value set on the prototype)
changes the shape and can [degrade performance][v8propaccess].

[v8propaccess]: https://developers.google.com/v8/design#prop_access

## Naming Conventions
### Use lowerCamelCase for variables, properties and function names

Variables, properties and function names should use `lowerCamelCase`.  They
should also be descriptive. Single character variables and uncommon
abbreviations should generally be avoided.

*Right:*

```js
var adminUser = db.query('SELECT * FROM users ...');
var itIsOkToHaveSuperLongVariableNames = 'whats up';
```

*Wrong:*

```js
var admin_user = db.query('SELECT * FROM users ...');
var nua = 'Never use abbreviations.';
```

#### Proper, well-known names should only capitalize the first character
Proper or well-known abbreviations such as URL, XML, VAST, OpenRTB shoud only
capitalize the first character of the abbreviation.

*Right:*

```js
var urlFormatter = 'is cool';
var isUrlFormatter = 'is cool';
var openRtbValue = 'is cool';
var aUrlThatEatsXmlAndProducesOpenRtb = 'is cool';
```

*Wrong:*

```js
var uRLFormatter = 'is not cool';
var URLFormatter = 'is not cool';
var isURLFormatter = 'is not cool';
var openRTBValue = 'is not cool';
var aURLThatEatsXMLAndProducesOpenRTB = 'is not cool';
```

### Use UpperCamelCase for enum and class names

Class names should be capitalized using `UpperCamelCase`. For example, when a
variable is annotated with `@constructor` or `@enum`, it better be an
UpperCamelCase.

*Right:*

```js
function BankAccount() {
}

/** @constructor */
var Client = function() {
};

/** @enum {string} */
var CountryLocale = {
  CHINA: 'zh-CN',
  US: 'en-US'
};
```

*Wrong:*

```js
function bank_Account() {
}

/** @constructor */
var client = function() {
};

/** @enum {string} */
var countryLocale = {
  CHINA: 'zh-CN',
  US: 'en-US'
};
```

### Use UPPERCASE for Constants

Constants should be declared as regular variables or static class properties,
using all uppercase letters.

*NOTE*: Use of ES6 keyword `const` is okay in NodeJS / V8 engines but
discouraged until ES6 becomes more widely accepted. And, variablenames should
still be be UPPERCASE_LIKE_THIS.

Annotation with `@const` is recommended for all constant variables.

*Right:*

```js
/** @const */
var SECOND = 1 * 1000;

var MINUTE = 60 * SECOND; // Okay, but discouraged.

function File() {
}

/** @const */
File.FULL_PERMISSIONS = 0777;
```

*Wrong:*

```js
var second = 1 * 1000;

function File() {
}

File.fullPermissions = 0777;
```

### File and Directories

File and directory names should be lower-lisp-case, such as `a-awesome-dir`,
`a-super-cool-file.js`, or `some-random-class.js`.

For test files, a suffix of `_test` must be inserted right before `.js` file
extension; e.g. `a-super-cool-file_test.js`, or `some-random-class_test.js`.

File name and directory names should contain no punctuation except for `-` or
`_`. (Prefer `-` to `_`).

In addition, unit test files should mirror the directory structure of the source
file except under a root `test` directory; e.g. `section-a/class-b.js` vs
`test/section-a/class-b_test.js`.

*Right:*

```
dev/section-a/subsection-2/big-giant-class.js # subsection is an english word.
dev/section-beta/multi-sections/constants.js
dev/section/special-section/mobile-api-routes.js

test/section/special-section/mobile-api-routes_test.js
```

*Wrong:*

```
dev/sectionA/subSection2/BigGiantClass.js
dev/sectionbeta/multiSections/Constants.js
dev/section/special-section/mobileApiRoutes.js

test/mobile-api-routes_test.js # Must match directory structure
```

### Properties and methods visibility

Private methods and properties should be named with a `_` prefix. E.g.
`_someVar`, `SomeClass.prototype._somePrivateMethod`, or `obj._privateProp`.

### Optional or variable function parameters

Optional function arguments start with `opt_`.

Functions that take a variable number of arguments should have the last argument
named `var_args`, it may never be referred in code. Use `arguments` array
instead.

*Right:*

```js
function someFunc(requiredArg, opt_arg) {
  // opt_arg is optional, in the last set of arguments.
}

function variableFunc(requiredArg, var_args) {
  hack(requiredArg);
  hackMore(arguments);
}
```


*Wrong:*

```js
function someFunc(opt_arg, requiredArg) {
  // requiredArg cannot follow an optional argument.
}

function variableFunc(requiredArg, var_args) {
  hack(requiredArg);
  // Do not refer var_args in function body.
  hackMore(var_args);
}
```

### Accessor Functions

Getters and setters methods for properties are *NOT* required. However, if they
are used, then getters must be named `getFoo()` and setters must be named
`setFoo(value)`. (For boolean getters, `isFoo()` is also acceptable,
and often sounds more natural.)

*Right:*

```js
var BankAccount = function() {};

BankAccount.prototype.getName = function() {
  // ...
};

BankAccount.prototype.setName = function(name) {
  // ...
};
```

*Wrong:*

```js
var BankAccount = function() {};

BankAccount.prototype.name = function() {
  // get name bank account name.
};

BankAccount.prototype.location = function(opt_location) {
  // if location is passed, it's a setter, otherwise, it's a getter.
};
```

#### Avoid ECMA5 Getters and Setters

Don't bother trying to be fancy here. They cause more problems for people who
try to use your software than they can solve.

If you have to use getters, make sure they free from [side effects][sideeffect],
like providing a length property for a collection class.

[sideeffect]: http://en.wikipedia.org/wiki/Side_effect_(computer_science)

## Use the === operator

Programming is not about remembering [stupid rules][comparisonoperators]. Use
the triple equality operator as it will work just as expected.

*Right:*

```js
var a = 0;
if (a !== '') {
  console.log('winning');
}

```

*Wrong:*

```js
var a = 0;
if (a == '') {
  console.log('losing');
}
```

[comparisonoperators]: https://developer.mozilla.org/en/JavaScript/Reference/Operators/Comparison_Operators

## Use multi-line ternary operator

The ternary operator should not be used on a single line. Split it up into multiple lines instead.

*Right:*

```js
var foo = (a === b)
  ? 1
  : 2;
```

*Wrong:*

```js
var foo = (a === b) ? 1 : 2;
```

## Do not extend built-in prototypes

Do not extend the prototype of native JavaScript objects. Your future self will
be forever grateful.

*Right:*

```js
var a = [];
if (!a.length) {
  console.log('winning');
}
```

*Wrong:*

```js
Array.prototype.empty = function() {
  return !this.length;
}

var a = [];
if (a.empty()) {
  console.log('losing');
}
```

## Use descriptive conditions

Any non-trivial conditions should be assigned to a descriptively named variable or function:

*Right:*

```js
var isValidPassword = password.length >= 4 && /^(?=.*\d).{4,}$/.test(password);

if (isValidPassword) {
  console.log('winning');
}
```

*Wrong:*

```js
if (password.length >= 4 && /^(?=.*\d).{4,}$/.test(password)) {
  console.log('losing');
}
```

## Write small functions

Keep your functions short. A good function fits on a slide that the people in
the last row of a big room can comfortably read. So don't count on them having
perfect vision and limit yourself to ~15 lines of code per function.

## Return early from functions

To avoid deep nesting of if-statements, always return a function's value as early
as possible.

*Right:*

```js
function isPercentage(val) {
  if (val < 0) {
    return false;
  }

  if (val > 100) {
    return false;
  }

  return true;
}
```

*Wrong:*

```js
function isPercentage(val) {
  if (val >= 0) {
    if (val < 100) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
```

Or for this particular example it may also be fine to shorten things even
further:

```js
function isPercentage(val) {
  var isInRange = (val >= 0 && val <= 100);
  return isInRange;
}
```

## Name your closures

Feel free to give your closures a name. It shows that you care about them, and
will produce better stack traces, heap and cpu profiles.

*Right:*

```js
req.on('end', function onEnd() {
  console.log('winning');
});
```

*Wrong:*

```js
req.on('end', function() {
  console.log('losing');
});
```

## No nested closures

Use closures, but don't nest them. Otherwise your code will become a mess.

*Right:*

```js
setTimeout(function() {
  client.connect(afterConnect);
}, 1000);

function afterConnect() {
  console.log('winning');
}
```

*Wrong:*

```js
setTimeout(function() {
  client.connect(function() {
    console.log('losing');
  });
}, 1000);
```

## Do not use associative Array

Never use `Array` as a map/hash/associative array; more precisely you are not
allowed to use non number indexes for `Array` types. If you need a map/hash use
`Object` instead of `Array` in these cases because the features that you want
are actually features of `Object` and not of `Array`. `Array` just happens to
extend `Object` (like any other object in JS and therefore you might as well
have used `Date`, `RegExp` or `String`).

*Right:*

```js
var arr = [1, 2, 3];
var obj = {};

obj['a'] = 'value';
obj[1] = 'value';
```

*Wrong:*

```js
var arr = [];
arr['0'] = 3;
arr.a = 'value';
```

## Array and Object literals

Initialize `Array` and `Object` literals with `[]` and `{}` rather than the
constructor.

*Right:*

```js
var myArray = [];
var myObject = {};
```

*Wrong:*

```js
var myArray = new Array();
var myObject = new Object();
```

Use trailing commas and put *short* declarations on a single line. Only quote
keys when your interpreter complains:

*Right:*

```js
var a = ['hello', 'world'];
var b = {
  good: 'code',
  'is generally': 'pretty',
};
var c = [
  'when there are',
  'a lot of items',
  'it is',
  'a good idea',
  'to keep',
  'one item',
  'per line'
];
var d = ['however', 'it', 'is', 'okay', 'if', 'you', 'have', 'just', 'a', 'few',
    'overflow'];
```

*Wrong:*

```js
var a = [
  'hello', 'world'
];
var b = {"good": 'code'
        , is generally: 'pretty'
        };
var c = [
  'but', 'never',
  'mix up'];
```

## Multi-line string literals

When a string literal grows to long, or when you are drafting a paragraph inside
of the code, make sure to break into multiple lines using string concatenation.

*Right:*

```js
var myString = 'A rather long string of English text, an error message ' +
    'actually that just keeps going and going -- an error ' +
    'message to make the Energizer bunny blush (right through ' +
    'those Schwarzenegger shades)! Where was I? Oh yes, ' +
    'you\'ve got an error and all the extraneous whitespace is ' +
    'just gravy.  Have a nice day.';
```

*Wrong:*

```js
var myString = 'A rather long string of English text, an error message \
                actually that just keeps going and going -- an error \
                message to make the Energizer bunny blush (right through \
                those Schwarzenegger shades)! Where was I? Oh yes, \
                you\'ve got an error and all the extraneous whitespace is \
                just gravy.  Have a nice day.';
```

## Writing Comments

*Referenced from [Google Style Guide][googlecomments]:*

All files, classes, methods and properties should be documented with
[JSDoc][jsdoc] comments with the appropriate annotations, tags and types.
Textual descriptions for properties, methods, method parameters and method
return values should be included unless obvious from the property, method, or
parameter name.

Complete sentences are recommended but not required. Complete sentences should
use appropriate capitalization and punctuation.

*Right:*

```js
/**
 * A JSDoc comment should begin with a slash and 2 asterisks.
 * Inline tags should be enclosed in braces like {@code this}.
 * @desc Block tags should always start on their own line.
 */

/** One line block comments like this are okay. */
```

*Wrong:*

```js
/*
Multi-line block comments should begin with two asterisks.
 */

/* C-style block comments are discouraged. */
```

If a line break is needed in block comments, you should indent the subsequent
lines with 4 spaces indent. The description paragraph in the block comments does
not need to be indented.

*Right:*

```js
/**
 * This description that spans more than one line does not need to indent its
 * subsequent lines.
 * @param {string} myString Descriptions preceded by a JsDoc annotation needs
 *     to indent the second line with 4 spaces.
 * @returns {boolean} This applies to any sentence following the JsDoc
 *     annotation.
 */
```

*Wrong:*

```js
/**
 * @param {string} myString Descriptions with anything other than 4 spaces
 * indentation are discouraged.
 */
```

[jsdoc]: https://github.com/jsdoc3/jsdoc
[googlecomments]: https://google.github.io/styleguide/javascriptguide.xml?showone=Comments#Comments

### Class comments

Each class should be created with a block comment documenting its purpose.

*Right:*

```js
/**
 * A descriptive documentation of the class.
 * @constructor
 * @param  {Array} myArg1 Description of the constructor argument.
 */
function myClass(myArg1) {}
```

*Wrong:*

```js
/**
 * Missing [at]constructor annotation is not allowed.
 */
function myClass() {}
```

### Line comments

Line comments are okay to use, but use them sparingly. A general rule of thumb
to use line comments is to only use line comments in places where it greatly
improves the code readability. Line comments across multiple lines does not need
to indent subsequent lines.

Never document a function or a variable with line comments.

*Right:*

```js
/**
 * Document a function with block comments.
 */
function myFunc() {  
  // Explain implementation details to improve code readability.
  someReally(complex(callThatNoOne(understands())));
}
```

*Wrong:*

```js
// Do not document a function with line comments.
function myFunc() {
  // No need to document simple logic.
  return 1 + 1;
}
```

### TODO Comments

Be very displined when adding a `TODO` in the code base. More often than not,
they won't be revisited for a while, and they add burdens in the entire code
base.

`TODO` comments can be added in both block or line comments. When adding a
`TODO` TODO must be the first word in the line. Subsequent lines do not need to
be indented.

*Right:*

```js
// TODO: Add config from some/tracking/link.

/**
 * TODO: @see Bug 1337
 */
```

*Wrong:*

```js
// Something TODO needs to be always the first word.
// TODO: Don't add a to-do for things that is already on the roadmap.
```

## Object.freeze, Object.preventExtensions, Object.seal, with, eval

Crazy shit that you will probably never need. Stay away from it.

## Avoid delete

In modern JavaScript engines, changing the number of properties on an object is
much slower than reassigning the values. The `delete` keyword should be avoided
except when it's necessary to remove a property from an object's iterated list
of keys, or to change the result of `if (key in obj)`.
