-----------------------------------------------------------------------------------------
-- Анимация стрелки часов(150 кадров на 6,5 сек)
-- timer.lua
-- Выпадко Владислав
-----------------------------------------------------------------------------------------

local sheetData = {}

sheetData.frames = {
    {
        x = 0,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 326,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },    

    {
        x = 652,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 978,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1304,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1630,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1956,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2282,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 2608,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2934,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3260,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3586,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3912,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4238,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4564,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4890,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5216,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5542,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5868,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6194,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6520,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6846,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7172,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 7498,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7824,
        y = 0,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 0,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 326,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 652,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 978,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1304,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1630,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1956,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 


    {
        x = 2282,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2608,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2934,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3260,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3586,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 3912,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4238,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4564,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 


    {
        x = 4890,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5216,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5542,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 


    {
        x = 5868,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6194,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6520,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6846,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7172,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7498,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7824,
        y = 551,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 0,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 326,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 652,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 978,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1304,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1630,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1956,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2282,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2608,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2934,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3260,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3586,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 3912,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4238,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4564,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 


    {
        x = 4890,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5216,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5542,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 


    {
        x = 5868,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6194,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6520,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6846,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7172,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7498,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7824,
        y = 1102,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 0,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 326,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 652,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 978,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1304,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1630,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1956,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2282,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2608,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2934,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3260,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3586,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 3912,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4238,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4564,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4890,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5216,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5542,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5868,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6194,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6520,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6846,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7172,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7498,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7824,
        y = 1653,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 0,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 326,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 652,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 978,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1304,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1630,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1956,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2282,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2608,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2934,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3260,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3586,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 3912,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4238,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4564,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4890,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5216,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5542,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5868,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6194,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6520,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6846,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7172,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7498,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7824,
        y = 2204,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 0,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 326,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 652,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 978,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1304,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1630,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 1956,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2282,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2608,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 2934,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3260,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 3586,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

    {
        x = 3912,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4238,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4564,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 4890,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5216,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5542,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 5868,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6194,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6520,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 6846,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7172,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7498,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    }, 

    {
        x = 7824,
        y = 2755,
        width = 326,
        height = 551,
        sourceWidth = 326,
        sourceHeight = 551,
    },

}

return sheetData