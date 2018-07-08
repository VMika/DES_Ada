
WITH P_StepHandler;
USE P_StepHandler;

with P_StructuralTypes;
use P_StructuralTypes;

package P_StepHandler.FeistelHandler is
   
   type T_BinaryIntegerArray is array (0..15) of T_BinaryUnit (1..4);
   
   type T_SBox is array (0..3, 0..15) of Integer;
   
   type T_SBoxArray is array (1..8) of T_SBox;
   
   type FeistelHandler is new T_StepHandler with private;
   
   type Ptr_FeistelHandler is access all FeistelHandler;
   
   --- CONSTRUCTOR ---
   function Make (Handler : in out FeistelHandler) return FeistelHandler;
   
   --- PROCEDURE ---
   procedure Handle (Self : in out FeistelHandler);
   
   function Process_Block (Self : in FeistelHandler;
                           Block : in out T_BinaryBlock)
                           return T_BinaryBlock;
   
   procedure Feistel_Round (Self : in FeistelHandler;
                           Block : in out T_BinaryBlock;
                           Round : in Integer);
   
   function Feistel_Function (Self : in FeistelHandler;
                              HalfBlock : T_BinaryHalfBlock;
                              SubKey : T_BinarySubKey)
                              return T_BinaryHalfBlock;
   
   function Expansion (HalfBlock : T_BinaryHalfBlock) 
                              return T_BinaryExpandedBlock;
                              
   function SBox_Substitution (Self : in FeistelHandler;
                               ExpandedBlock : T_BinaryExpandedBlock) 
                               return T_BinaryHalfBlock;
   
   function SBox_Output (Self : in FeistelHandler;
                         Input : T_BinaryUnit;
                         SBoxNumber : Integer) return T_BinaryUnit;
   
   function Permutation (HalfBlock : T_BinaryHalfBlock)
                         return T_BinaryHalfBlock;
   
   procedure FinalInversion (Block : in out T_BinaryBlock);
   
   ---- GETTER ----
    
   function Get_SBoxArray (Self : in out FeistelHandler) return T_SBoxArray;
   
   function Get_SBoxOutputArray (Self : in out FeistelHandler) 
                                 return T_BinaryIntegerArray;
   
   ---- SETTER ----
   
   procedure Set_SubKeyArrayAccess (Self : in out FeistelHandler;
                                    Ptr : in BinarySubKeyArray_Access);
   
   procedure Set_Mode (Self : in out FeistelHandler;
                       Mode : Character);
PRIVATE
   
   type FeistelHandler is new P_StepHandler.T_StepHandler with record
      Ptr_SubKeyArray : BinarySubKeyArray_Access;
      SBoxOutputArray : T_BinaryIntegerArray;
      SBoxArray : T_SBoxArray;
      Mode : Character;
   end record;
   
   

end P_StepHandler.FeistelHandler;
