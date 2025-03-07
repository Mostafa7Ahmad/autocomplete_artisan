# Autocomplete for Laravel Artisan Commands in Cmder

## Introduction
This method enables automatic suggestions for Artisan commands when using [Cmder](https://cmder.net/) with Clink support, making Laravel project management easier.

![Autocomplete Example](https://raw.githubusercontent.com/Mostafa7Ahmad/autocomplete_artisan/refs/heads/main/screenshots/1.jpg)

## Requirements
- [Cmder](https://cmder.net/) (Full version with Clink)
- PHP installed on the system
- Laravel project

## Installation

### 1. Copy the `vendor` folder
- Place it in the following path: `%CMDER_ROOT%\vendor\json.lua`

### 2. Enable the settings
Restart Cmder or run the command:
```bash
clink reload
```

## Usage
1. Type `artisan` or `php artisan` in the terminal
2. Press `Tab` to see the available command list

## Troubleshooting

### Commands do not appear:
- Ensure you are inside a Laravel project folder
- Verify the `json.lua` file is correctly installed

### JSON parsing errors:
- Manually test JSON output with:
  ```bash
  php artisan list --format=json
  ```
- If it fails, try updating Laravel:
  ```bash
  composer update
  ```

## Customization
To modify autocomplete behavior, you can:
1. Open the settings file:

```
%CMDER_ROOT%\clink-completions\artisan.lua
```
2. Make necessary changes, such as:
   - Changing the default path for Cmder
   - Filtering specific commands

## Support
If you encounter any issues, please open an `issue` in your project's tracking system.

## License
MIT

> **Notes:**
> 1. Replace `%CMDER_ROOT%` with the actual Cmder installation path (usually `C:\cmder`)
> 2. You can use an actual image for autocomplete instead of the placeholder image
> 3. Add appropriate links in the support section based on your tracking system

