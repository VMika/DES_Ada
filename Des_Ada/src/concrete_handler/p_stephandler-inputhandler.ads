WITH P_StepHandler;
USE P_StepHandler;

with P_StructuralTypes;
use P_StructuralTypes;

with Ada.Streams;
use Ada.Streams;

package P_StepHandler.InputHandler is
   
   type InputHandler is new T_StepHandler with private;
   
   type Ptr_InputHandler is access InputHandler;
   
   --- CONSTRUCTOR ---
   function Make (Self : in out InputHandler;
                  File_Name : in Unbounded_String) return InputHandler;
   
   --- PROCEDURE ---
   procedure Handle (Self : in out InputHandler);
   
   --- GETTER ---
   
   function Get_Input_Size (Self : in InputHandler) return Integer;
   
   function Get_PaddingBitsNumber (Self : in InputHandler) return Integer;
   
   procedure Set_Input_Length (Self : in out InputHandler;
                               Length : in Integer);
   
   procedure Set_Input_Size (Self : in out InputHandler ; Size : in Integer);

   
PRIVATE
   
   type InputHandler is new P_StepHandler.T_StepHandler with record
      Key : T_Key;
      Input_Length : Integer := 0;
      Input_Size : Integer := 0;
      Input_Name : Unbounded_String;
      PaddingBitsNumber : Integer := 0;
   end record;  

end P_StepHandler.InputHandler;
