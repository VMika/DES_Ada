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

with Ada.Strings;
use Ada.Strings;

with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Ada.Strings.Unbounded.Text_IO;

with P_StructuralTypes; 
use P_StructuralTypes;

with Ada.Strings.Unbounded; 
use Ada.Strings.Unbounded;

with Ada.Real_Time;
use Ada.Real_Time;

procedure mainParallel is
--------------------------------------------------------------------------------
---                           PROCEDURES                                     ---
--------------------------------------------------------------------------------
   
   function Request_Input_Name return Unbounded_String is 
   begin
      Put ("Choose the input file : ");
      return Ada.Strings.Unbounded.Text_IO.Get_Line;
   end;
   
   function Request_Output_Name return Unbounded_String is 
   begin
      Put ("Choose the output file (a new file will be created) : ");
      return Ada.Strings.Unbounded.Text_IO.Get_Line;
   end;
   
   function Request_Mode return Character is
      Mode : Character := '.';
   begin
      while (Mode /= 'D' and Mode /= 'E') loop
         Put ("Choose mode of algorithm (E for encryption, D for deciphering) : ");
         Mode := To_String(Ada.Strings.Unbounded.Text_IO.Get_Line)(1);
      end loop;
      return Mode;
   end;
   
   function Request_Key return T_Key is
      Tmp_Key : Unbounded_String;
   begin
      while Length(Tmp_Key) /= 8 loop
         Put ("Choose a key (must be exactly 8 characters long) : ");
         Tmp_Key := Ada.Strings.Unbounded.Text_IO.Get_Line; 
      end loop;
      return To_String (Tmp_Key);
   end;
   
   
   
--------------------------------------------------------------------------------
---                            TASK TYPE                                     ---
--------------------------------------------------------------------------------
   type IP_Task;
   type Feistel_Task;
   type ReverseIP_Task;
   type Output_Task;
   
   
   type Ptr_IP_Task is access all IP_Task;
   type Ptr_Feistel_Task is access all Feistel_Task;
   type Ptr_ReverseIP_Task is access all ReverseIP_Task;
   type Ptr_Output_Task is access all Output_Task;
   
   
   
   task type IP_Task (Handler : Ptr_IPHandler) is
      entry Next_Task (Next_Step : Ptr_Feistel_Task);
      entry Process_Token (Token : T_BinaryBlock ; Id : Integer);
   end IP_Task;
   
   task type Feistel_Task (Handler : Ptr_FeistelHandler) is
      entry Next_Task (Next_Step : Ptr_ReverseIP_Task);
      entry Process_Token (Token : T_BinaryBlock ; Id : Integer);
   end Feistel_Task;
   
   task type ReverseIP_Task (Handler : Ptr_ReverseIPHandler) is
      entry Next_Task (Next_Step : Ptr_Output_Task);
      entry Process_Token (Token : T_BinaryBlock ; Id : Integer);
   end ReverseIP_Task;
   
   task type Output_Task (Ptr_Output : BinaryContainer_Access) is
      entry Process_Token (Token : T_BinaryBlock ; Id : Integer);
   end Output_Task;
     
--------------------------------------------------------------------------------
---                         TASK DEFINITION                                  ---
--------------------------------------------------------------------------------   
   task body IP_Task is
      Next : Ptr_Feistel_Task;
      Block : T_BinaryBlock;
      Index : Integer;
   begin
      accept Next_Task (Next_Step : in Ptr_Feistel_Task) do
         Next := Next_Step;
      end Next_Task;
      
      loop
         select 
            accept Process_Token (Token : in T_BinaryBlock; Id : in Integer) do
               Block := Token;
               Index := Id;
            end Process_Token;
            Block := Handler.Process_Block (Block);
            Next.Process_Token (Block, Index);
            
            or
               terminate;
            end select;
      end loop;
         
   end IP_Task;
   
   task body Feistel_Task is
      Next : Ptr_ReverseIP_Task;
      Block : T_BinaryBlock;
      Index : Integer;
   begin
      accept Next_Task (Next_Step : in Ptr_ReverseIP_Task) do
         Next := Next_Step;
      end Next_Task;
      
      loop
         select
            accept Process_Token (Token : in T_BinaryBlock; Id : in Integer) do
               Block := Token;
               Index := Id;
            end Process_Token;
            Block := Handler.Process_Block (Block);
            Next.Process_Token (Block, Index);
         or
            terminate;
         end select;
      end loop;
      
   end Feistel_Task;
   
   task body ReverseIP_Task is
      Next : Ptr_Output_Task;
      Block : T_BinaryBlock;
      Index : Integer;
   begin
      accept Next_Task (Next_Step : in Ptr_Output_Task) do
         Next := Next_Step;
      end Next_Task;
      
      loop
         select
            accept Process_Token (Token : in T_BinaryBlock; Id : in Integer) do
               Block := Token;
               Index := Id;
            end Process_Token;
            Block := Handler.Process_Block (Block);
               Next.Process_Token (Block, Index);
            or
               terminate;
         end select;
      end loop;
        
      end ReverseIP_Task;
      
   task body Output_Task is
      Block : T_BinaryBlock;
      Index : Integer;
   begin
      loop
         select
            accept Process_Token (Token : in T_BinaryBlock; Id : in Integer) do
               Block := Token;
               Index := Id;
            end Process_Token;
            Ptr_Output.all(Index) := Block;
         or
            terminate;
         end select;
         
      end loop;
      
   end Output_Task;
   
      
   
--------------------------------------------------------------------------------
---                    VARIABLES DEFINITION                                  ---
--------------------------------------------------------------------------------
   -- User's input
   Input_Name  : Unbounded_String;
   Output_Name : Unbounded_String;
   Ptr_Key     : Key_Access  := new T_Key;
   Mode : Character; 
     
   -- Handlers
   InputLink     : aliased InputHandler;
   IPLink        : aliased IPHandler;
   KeyGenLink    : aliased KeyHandler;
   FeistelLink   : aliased FeistelHandler;
   ReverseIPLink : aliased ReverseIPHandler;
   OutputLink    : aliased OutputHandler;
   
   -- SubKey array
   Ptr_SubKey_Array : BinarySubKeyArray_Access := new T_BinarySubKeyArray;
   
begin
   
   --- Request user's informations
   Input_Name := Request_Input_Name;
   Output_Name := Request_Output_Name;
   Mode := Request_Mode;
   Ptr_Key.all := Request_Key;
   
   --- Creating all the new link (handlers)
   InputLink     := Make (InputLink, Input_Name);
   KeyGenLink    := Make (KeyGenLink);
   IPLink        := Make (IPLink);
   FeistelLink   := Make (FeistelLink);
   ReverseIPLink := Make (ReverseIPLink);
   OutputLink    := Make (OutputLink);
   
   --- Setting parameters for key generation
   KeyGenLink.Set_KeyAccess(Ptr_Key);
   KeyGenLink.Set_SubKeyArrayAccess(Ptr_SubKey_Array);
      
   declare
      Ptr_BinaryContainer : constant BinaryContainer_Access 
        := new T_BinaryContainer(1..InputLink.Get_Input_Size);
      
      Ptr_OutputContainer : constant BinaryContainer_Access 
        := new T_BinaryContainer(1..InputLink.Get_Input_Size);
   begin
      InputLink.Set_BinaryContainer(Ptr_BinaryContainer);
      IPLink.Set_BinaryContainer(Ptr_BinaryContainer);
      FeistelLink.Set_BinaryContainer(Ptr_BinaryContainer);
      ReverseIPLink.Set_BinaryContainer(Ptr_BinaryContainer);
      
      FeistelLink.Set_SubKeyArrayAccess(Ptr_SubKey_Array);
      FeistelLink.Set_Mode(Mode);
      
      OutputLink.Set_BinaryContainer(Ptr_OutputContainer);
      OutputLink.Set_Output_Name(Output_Name);

   end;
   
   InputLink.Handle;
   KeyGenLink.Handle;
   
   declare
      IP        : aliased IP_Task (IPLink'Unchecked_Access);
      Feistel   : aliased Feistel_Task (FeistelLink'Unchecked_Access);
      ReverseIP : aliased ReverseIP_Task (ReverseIPLink'Unchecked_Access);
      Output    : aliased Output_Task (OutputLink.Get_BinaryContainer);
   begin
      IP.Next_Task (Feistel'Unchecked_Access);
      Feistel.Next_Task (ReverseIP'Unchecked_Access);
      ReverseIP.Next_Task (Output'Unchecked_Access);
      
      for i in InputLink.Get_BinaryContainer'Range loop
         IP.Process_Token (InputLink.Get_BinaryContainer.all(i), i);
      end loop;
   end;
   
   OutputLink.Handle;
      
end mainParallel;
