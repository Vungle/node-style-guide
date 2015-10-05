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

* [2 Spaces for indention](#2-spaces-for-indention)
* [Newlines](#newlines)
* [No trailing whitespace](#no-trailing-whitespace)
* [Use Semicolons](#use-semicolons)
* [80 characters per line](#80-characters-per-line)
* [Use single quotes](#use-single-quotes)
* [Opening braces go on the same line](#opening-braces-go-on-the-same-line)
* [Method chaining](#method-chaining)
* [Declare one variable per var statement](#declare-one-variable-per-var-statement)
* [Declare classes](#declare-classes)
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
* [Getters and setters](#getters-and-setters)
* [Avoid delete](#avoid-delete)

## 2 Spaces for indention

Use 2 spaces for indenting your code and swear an oath to never mix tabs and
spaces - a special kind of hell is awaiting you otherwise.

## Newlines

Use UNIX-style newlines (`\n`), and a newline character as the last character
of a file. Windows-style newlines (`\r\n`) are forbidden inside any repository.

## No trailing whitespace

Just like you brush your teeth after every meal, you clean up any trailing
whitespace in your JS files before committing. Otherwise the rotten smell of
careless neglect will eventually drive away contributors and/or co-workers.

## Use Semicolons

According to [scientific research][hnsemicolons], the usage of semicolons is
a core value of our community. Consider the points of [the opposition][], but
be a traditionalist when it comes to abusing error correction mechanisms for
cheap syntactic pleasures.

### Do not append semicolons after function unless declared with var
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

## 80 characters per line

Limit your lines to 80 characters. Yes, screens have gotten much bigger over the
last few years, but your brain has not. Use the additional room for split screen,
your editor supports that, right?

## Use single quotes

Use single quotes, unless you are writing JSON.

*Right:*

```js
var foo = 'bar';
```

*Wrong:*

```js
var foo = "bar";
```

## Opening braces go on the same line

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

Also, notice the use of whitespace before and after the condition statement.

## Method chaining

One method per line should be used if you want to chain methods.

You should also indent these methods so it's easier to tell they are part of the same chain.

*Right:*

```js
User
  .findOne({ name: 'foo' })
  .populate('bar')
  .exec(function(err, user) {
    return true;
  });
```

*Wrong:*

```js
User
.findOne({ name: 'foo' })
.populate('bar')
.exec(function(err, user) {
  return true;
});

User.findOne({ name: 'foo' })
  .populate('bar')
  .exec(function(err, user) {
    return true;
  });

User.findOne({ name: 'foo' }).populate('bar')
.exec(function(err, user) {
  return true;
});

User.findOne({ name: 'foo' }).populate('bar')
  .exec(function(err, user) {
    return true;
  });
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

## Use lowerCamelCase for variables, properties and function names

Variables, properties and function names should use `lowerCamelCase`.  They
should also be descriptive. Single character variables and uncommon
abbreviations should generally be avoided.

*Right:*

```js
var adminUser = db.query('SELECT * FROM users ...');
```

*Wrong:*

```js
var admin_user = db.query('SELECT * FROM users ...');
```

## Use UpperCamelCase for class names

Class names should be capitalized using `UpperCamelCase`.

*Right:*

```js
function BankAccount() {
}
```

*Wrong:*

```js
function bank_Account() {
}
```

## Use UPPERCASE for Constants

Constants should be declared as regular variables or static class properties,
using all uppercase letters.

Node.js / V8 actually supports mozilla's [const][const] extension, but
unfortunately that cannot be applied to class members, nor is it part of any
ECMA standard.

*Right:*

```js
var SECOND = 1 * 1000;

function File() {
}
File.FULL_PERMISSIONS = 0777;
```

*Wrong:*

```js
const SECOND = 1 * 1000;

function File() {
}
File.fullPermissions = 0777;
```

[const]: https://developer.mozilla.org/en/JavaScript/Reference/Statements/const

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
lines with 2 spaces indent. The description paragraph in the block comments does
not need to be indented.

*Right:*

```js
/**
 * This description that spans more than one line does not need to indent its
 * subsequent lines.
 * @param {string} myString Descriptions preceded by a JsDoc annotation needs
 *   to indent the second line with 2 spaces.
 * @returns {boolean} This applies to any sentence following the JsDoc
 *   annotation.
 */
```

*Wrong:*

```js
/**
 * @param {string} myString Descriptions with anything other than 2 spaces
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

## Getters and setters

Do not use setters, they cause more problems for people who try to use your
software than they can solve.

Feel free to use getters that are free from [side effects][sideeffect], like
providing a length property for a collection class.

[sideeffect]: http://en.wikipedia.org/wiki/Side_effect_(computer_science)

## Avoid delete

In modern JavaScript engines, changing the number of properties on an object is
much slower than reassigning the values. The `delete` keyword should be avoided
except when it's necessary to remove a property from an object's iterated list
of keys, or to change the result of `if (key in obj)`. The alternative to
`delete` is to simply set `null` to the property.
