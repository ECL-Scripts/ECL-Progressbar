# ECL-Progressbar

Modern and minimal progressbar system for FiveM built with smooth animations, optimized performance and premium UI design.

━━━━━━━━━━━━━━━━━━━━━━

## Features

• Modern dark UI
• Smooth animations
• Cancel support
• Customizable colors
• Animation integration
• Disable controls support
• Optimized performance
• Lightweight design
• Standalone support
• Clean ecosystem styling

━━━━━━━━━━━━━━━━━━━━━━

## Compatibility

• Standalone
• ESX
• QBCore
• ox_core

━━━━━━━━━━━━━━━━━━━━━━

## Preview
<img width="1672" height="941" alt="ECL-Progressbar" src="https://github.com/user-attachments/assets/6c45d560-f6b6-421c-8d1e-7ac1f42cc977" />

Preview video coming soon.

━━━━━━━━━━━━━━━━━━━━━━

## Installation

Add the resource to your `resources` folder and ensure it in your `server.cfg`.

```cfg id="jlwmek"
ensure ECL-Progressbar
```

━━━━━━━━━━━━━━━━━━━━━━

## Export Example

```lua id="jlwmel"
exports['ECL-Progressbar']:Start({

    label = 'Repairing vehicle...',

    duration = 5000,

    disable = {

        move = true,

        combat = true,

        vehicle = true
    },

    anim = {

        dict = 'mini@repair',

        clip = 'fixing_a_ped',

        flags = 49
    }

}, function(cancelled)

    if cancelled then

        print('Cancelled')

        return
    end

    print('Completed')

end)
```

━━━━━━━━━━━━━━━━━━━━━━

## Discord

https://discord.gg/tBkbfATVrz

━━━━━━━━━━━━━━━━━━━━━━

## Credits

Developed by ECL Scripts.

Premium FiveM Development
