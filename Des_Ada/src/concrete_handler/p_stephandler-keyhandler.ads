WITH P_StepHandler;
USE P_StepHandler;

WITH P_StructuralTypes;
USE P_StructuralTypes;

package P_StepHandler.KeyHandler is
   
   type KeyHandler is new T_StepHandler with private;
   
   type Ptr_KeyHandler is access KeyHandler;

   --- CONSTRUCTOR ---
   function Make (Self : in out KeyHandler) return KeyHandler;
   
   --- PROCEDURE ---
   procedure Handle (Self : in out KeyHandler);
   
   --- FUNCTION ---
   function PermutationChoice1_Key (BinaryKey : in out T_BinaryKey)
                                    return T_BinaryFormattedKey;
   
--     procedure LeftShift (BinaryKey : in out T_BinaryKey;
--                         Round : in Positive);
   
   function PermutationChoice2_Key (Key : in out T_BinaryFormattedKey) 
                                    return T_BinarySubKey;
   
   procedure KeyShift (Key : in out T_BinaryFormattedKey;
                        Round : in Positive);
   
   --- SETTER ---
   procedure Set_KeyAccess (Self : in out KeyHandler;
                            Ptr_Key : in Key_Access);
   
   procedure Set_SubKeyArrayAccess (Self : in out KeyHandler;
                                    Ptr_SubKeyAray : in BinarySubKeyArray_Access);
   
                                    
PRIVATE
   
   type KeyHandler is new P_StepHandler.T_StepHandler with record
      Ptr_SubKeyArray : BinarySubKeyArray_Access;
      Ptr_Key : Key_Access;
   end record;
   
   

end P_StepHandler.KeyHandler;
