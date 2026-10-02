return {
    "smoka7/multicursors.nvim"  ,
    name = "multicursors"       ,
    dependencies = {
        "nvimtools/hydra.nvim"  ,
    }                           ,
    opts = {}                   ,
    cmd = {
        "MCstart"  , "MCvisual"       , "MCclear"       ,
        "MCpattern", "MCvisualPattern", "MCunderCursor" ,
    }                           ,
    keys = {
        {
            mode = {"v", "n"}   ,
            "Q"                 ,
            "<CMD>MCstart<CR>"  ,
        }   ,
    }                           ,
}

