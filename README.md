# Exports

---

# Start Progressbar

```
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

---

# Parameters

| Parameter | Type    | Description                     |
|-----------|---------|---------------------------------|
| label     | string  | Progressbar text                |
| duration  | number  | Duration in milliseconds        |
| disable   | table   | Disable player controls         |
| anim      | table   | Play animation                  |
| scenario  | string  | Play scenario                   |

---

# Disable Controls

```
disable = {

    move = true,

    combat = true,

    vehicle = true
}

```
| Control | Description              |
|---------|--------------------------|
| move    | Disable movement         |
| combat  | Disable combat/shooting  |
| vehicle | Disable entering vehicle |

---

# Example

```
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

        clip = 'fixing_a_ped'
    }
})
```

---

# Installation

Add this to your server.cfg

```cfg
ensure ECL-Progress
```

---

# Created by Eclipse Scripts