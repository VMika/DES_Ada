with Ada.Strings.Unbounded; 
use Ada.Strings.Unbounded;

package P_StructuralTypes is
   
   subtype T_Key is String (1..8);
   
   type T_Bit is mod 2
     with Size => 1;
   
   type T_BinaryUnit is array (Positive range <>) of T_Bit
     with Default_Component_Value => 0;
   pragma Pack (T_BinaryUnit);
   
   subtype T_BinaryBlock is T_BinaryUnit (1..64);
   
   subtype T_Byte is T_BinaryUnit (1..8);
   
   subtype T_BinaryExpandedBlock is T_BinaryUnit (1..48);
   
   subtype T_BinaryHalfBlock is T_BinaryUnit (1..32);
         
   subtype T_BinaryKey is T_BinaryUnit (1..64);
   
   subtype T_BinaryFormattedKey is T_BinaryUnit (1..56);
   
   subtype T_BinaryHalfFormattedKey is T_BinaryUnit (1..28);
    
   subtype T_BinarySubKey is T_BinaryUnit (1..48);
     
   type T_BinaryContainer is array (Positive range <>) of T_BinaryBlock;
   pragma Pack (T_BinaryContainer);
   
   type T_BinarySubKeyArray is  array (1..16) of T_BinarySubKey;
   pragma Pack (T_BinarySubKeyArray);

   -----------------------------------------------------------------------------
   -------------------------------- ACCESS -------------------------------------
   -----------------------------------------------------------------------------
   
   type BinaryContainer_Access is access T_BinaryContainer;
   
   type BinarySubKeyArray_Access is access T_BinarySubKeyArray;
   
   type Key_Access is access T_Key;
   
   -----------------------------------------------------------------------------
   ----------------------------- FUNCTIONS -------------------------------------
   -----------------------------------------------------------------------------
   
   function O_plus (b1 : in T_BinaryUnit ; b2 : in T_BinaryUnit) return T_BinaryUnit;
   
   function TextBlock_To_Binary (Block : String) return T_BinaryBlock;
   
   function Byte_To_CharacterCode (Byte : in T_Byte) return Integer;
   
   function Integer_To_Binary (Number : Integer;
                               NbBits : Integer) return T_BinaryUnit;
   
   procedure Replace_Block (Ptr_BinaryContainer : in BinaryContainer_Access;
                            Index : in Integer;
                            BinaryBlock : in T_BinaryBlock);
   
   procedure Left_Shift (Unit : in out T_BinaryUnit;
                        Iteration : in Positive);
   
   function Left (Block : T_BinaryUnit) return T_BinaryUnit;
   
   function Right (Block : T_BinaryUnit) return T_BinaryUnit;
   
   procedure Put_BinaryUnit (Unit : T_BinaryUnit);        
                              
end P_StructuralTypes;
