module Inco exposing (Code(..), list, next, prev, scroll)

{-| The inco codes


# Types
@docs Code

# Helpers
@docs list

-}


{-| the inco codes

-}
type Code
    = EXW
    | FCA
    | FAS
    | FOB
    | CFR
    | CIF
    | CPT
    | CIP
    | DAF
    | DES
    | DEQ
    | DDU
    | DDP


{-| Helper function to retrieve the inco codes as a list

-}
list : List Code
list =
    [ EXW
    , FCA
    , FAS
    , FOB
    , CFR
    , CIF
    , CPT
    , CIP
    , DAF
    , DES
    , DEQ
    , DDU
    , DDP
    ]


next : Code -> Code
next inco =
    case inco of
        EXW -> FCA   
        FCA -> FAS        
        FAS -> FOB        
        FOB -> CFR        
        CFR -> CIF        
        CIF -> CPT        
        CPT -> CIP        
        CIP -> DAF        
        DAF -> DES        
        DES -> DEQ        
        DEQ -> DDU
        DDU -> DDP
        DDP -> EXW


prev : Code -> Code
prev inco =
    case inco of
        EXW -> DDP   
        FCA -> EXW        
        FAS -> FCA        
        FOB -> FAS        
        CFR -> FOB        
        CIF -> CFR        
        CPT -> CIF        
        CIP -> CPT        
        DAF -> CIP        
        DES -> DAF        
        DEQ -> DES
        DDU -> DEQ
        DDP -> DDU

    
scroll : Code -> Float
scroll inco =
    case inco of
        EXW -> 0   
        FCA -> 0       
        FAS -> 0        
        FOB -> 0      
        CFR -> (48 * 4)        
        CIF -> (48 * 4)        
        CPT -> (48 * 4)        
        CIP -> (48 * 4)        
        DAF -> (48 * 8)        
        DES -> (48 * 8)        
        DEQ -> (48 * 8)
        DDU -> (48 * 8)
        DDP -> (48 * 12)