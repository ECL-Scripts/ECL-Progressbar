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

Preview video coming soon.

<img width="1672" height="941" alt="ECL-Progressbar" src="https://github.com/user-attachments/assets/7d4a56da-66c3-44c8-a1f1-3a7b21fe97a7" />


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
        return
    end
end)
```

━━━━━━━━━━━━━━━━━━━━━━

## Discord

https://discord.gg/tBkbfATVrz

━━━━━━━━━━━━━━━━━━━━━━

## Credits

Developed by ECL Scripts.

Premium FiveM Development

