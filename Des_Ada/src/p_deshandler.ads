With Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

WITH P_StructuralTypes;
USE P_StructuralTypes;

with Ada.Streams;
use Ada.Streams;

with Ada.Sequential_IO;
with Ada.Text_IO;
use Ada.Text_IO;

WITH P_StepHandler.InputHandler;
USE P_StepHandler.InputHandler;

WITH P_StepHandler.IPHandler;
USE P_StepHandler.IPHandler;

WITH P_StepHandler.KeyHandler;
USE P_StepHandler.KeyHandler;

WITH P_StepHandler.FeistelHandler;
USE P_StepHandler.FeistelHandler;

WITH P_StepHandler.ReverseIPHandler;
USE P_StepHandler.ReverseIPHandler;

WITH P_StepHandler.OutputHandler;
USE P_StepHandler.OutputHandler;

WITH Ada.Strings;
USE Ada.Strings;

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package P_deshandler is
   
   type DesHandler is tagged private;

   --- CONSTRUCTOR ---
   procedure Process (Self : in out DesHandler);
   
   procedure Handle (Self : in out DesHandler);
   
private
   
   procedure Create_Binary_Data_Container (Self : in out DesHandler);
   
   procedure Process_Request (Self : in out DesHandler);
   
   procedure Set_Handlers_Order (Self : in out DesHandler);
   
   procedure Set_Handlers_Container (Self : in out DesHandler);
   
   
   type DesHandler is tagged record 
      Input_Name : Unbounded_String;
      Output_Name : Unbounded_String;
      Mode : Character;
      Ptr_Container : BinaryContainer_Access;
      
      Ptr_Key : Key_Access  := new T_Key;
      Ptr_SubKey_Array : BinarySubKeyArray_Access
        := new T_BinarySubKeyArray;
      
      InputLink     : aliased InputHandler;
      IPLink        : aliased IPHandler;
      KeyGenLink    : aliased KeyHandler;
      FeistelLink   : aliased FeistelHandler;
      ReverseIPLink : aliased ReverseIPHandler;
      OutputLink    : aliased OutputHandler;
   end record;
   
      
      
      
   

end P_deshandler;
