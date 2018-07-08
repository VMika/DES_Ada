WITH P_StepHandler;
USE P_StepHandler;

WITH Ada.Strings.Unbounded.Text_IO;
WITH P_StructuralTypes;
USE P_StructuralTypes;

WITH Ada.Sequential_IO;


package P_StepHandler.OutputHandler is
   
   type OutputHandler is new T_StepHandler with private;
   
   type Ptr_OutputHandler is access OutputHandler;
   
   --- CONSTRUCTOR ---
   function Make (Self : in out OutputHandler) return OutputHandler;
   
   --- PROCEDURE ---
   procedure Handle (Self : in out OutputHandler);
   
   procedure Set_PaddingBitNumber (Self : in out OutputHandler;
                                   Number : in Integer);
   
   procedure Set_Output_Name (Self : in out OutputHandler; 
                             Name : Unbounded_String);
   
   
PRIVATE
   
   type OutputHandler is new P_StepHandler.T_StepHandler with record
      PaddingBitNumber : Integer;
      Output_Name : Unbounded_String;
   end record;
   

end P_StepHandler.OutputHandler;
