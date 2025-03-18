# Table of Contents

- [Description](#description)
- [Customization](#customization)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Changelog](#changelog)
- [License](#license)
- [Inspiration](#inspiration)
- [TODO](#todo)

## Description

A simple Nushell plugin that shows an alias when you use a command that has
an alias defined. Useful for remembering previously set aliases.

Written as a pure Nushell script for speed. Extremely simple (directly looks
up the command in `aliases`)

```nu
> ls -a  
"Alias Tip: la"

│ # │ name         │  
├───┼──────────────┤  
│ 0 │ CHANGELOG.md │  
│ 1 │ LICENCE      │  
│ 2 │ README.md    │  
│ 3 │ alias-finder │  
│ 4 │ nupm.nuon    │  
```

## Customization

| Variable                | Description | Default             |
|----------------------------------|-----------------------------------------------------------------|---------------------|
| `NU_ALIAS_FINDER_PREFIX`| Prefix used for aliased command display. | ` Alias Tip:`|
| `NU_ALIAS_FINDER_IGNORED`  | Comma delimited string of ignored aliases.| `''`|

## Installation

Clone the repository and source the module in your `config.nu`:

```nu
overlay use /path/to/alias-finder.nu
```

## Usage

Once sourced, you'll see a tip about
 using an alias for the command if you haven’t used it.

## Contributing

Issues and pull requests are welcome!
Feel free to contribute improvements or new features.

## Changelog

All changelogs can be found in the [CHANGELOG.md](./CHANGELOG.md) file.

## License

This project is licensed under the MIT License.

## Inspiration

This plugin is based on
 [zsh-alias-finder](https://github.com/akash329d/zsh-alias-finder), originally
 created for Zsh. It has been adapted for Nushell to provide the same
 functionality

## TODO

- [x] Add option to ignore certain commands
- [x] Add option to show the tip in different format
- [ ] Add option customize color of the tip
