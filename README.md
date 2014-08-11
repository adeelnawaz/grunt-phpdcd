# grunt-phpdcd

> Grunt plugin for running [PHP Dead Code Detector](https://github.com/sebastianbergmann/phpdcd).

_This plugin is developed for Grunt `0.4.0` and is not tested for backward compatibility with Grunt `0.3.x`._

## Getting Started

1. Install this grunt plugin with the follwing command:

```shell
npm install grunt-phpdcd --save-dev
```

2. [Install PHPDCD](https://github.com/sebastianbergmann/phpdcd#installation)

3. Add this to your project's `Gruntfile.js`:

```js
grunt.loadNpmTasks('grunt-phpdcd');
```

## PHPDCD task

_Run this task with the `grunt phpdcd` command._

_This task is a [multi task][] so any targets, files and options should be specified according to the [multi task][] documentation._

[multi task]: https://github.com/gruntjs/grunt/wiki/Configuring-tasks

### Usage Example

```js
phpdcd: {
  application: {
	  dir: ['application']
	},
	options: {
	  namesExclude: 'config.php,settings.php'
	}
}
```

### Target Properties

#### dir
Type: `Array`

The files or directories where phpdcd should search for files.

### Options
#### bin
Type: `String`
Default: `'phpdcd'`

The binary name if it is in your PATH or the full path if not.

#### names
Type: `String`
Default: `false`

A comma-separated list of file names to check (default: [`"*.php"`]).

#### namesExclude
Type: `String`
Default: `false`

A comma-separated list of file names to exclude.

#### exclude
Type: `Array`
Default: `false`

A list of directories where phpdcd should not search for files.

#### recursive
Type: `Boolean`
Default: `false`

Report code as dead if it is only called by dead code.

#### quiet
Type: `Boolean`
Default: `false`

Do not output any message.

#### verbose
Type: `Number [1-3]`
Default: `false`

Increase the verbosity of messages.

- 1 for normal output
- 2 for more verbose output
- 3 for debug

#### maxBuffer
Type: `Number`
Default: `200*1024`

Override the maxBuffer-Size of nodejs's exec() function if you expect a long output on stdout.

---
Inspired by [grunt-phpmd](https://github.com/alappe/grunt-phpmd)