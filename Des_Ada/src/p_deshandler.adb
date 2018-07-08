with P_StructuralTypes; use P_StructuralTypes;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Sequential_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Streams; use Ada.Streams;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;

package body P_deshandler is
   
   procedure Process (Self : in out DesHandler) is
      InputLink     : aliased InputHandler;
      IPLink        : aliased IPHandler;
      KeyGenLink    : aliased KeyHandler;
      FeistelLink   : aliased FeistelHandler;
      ReverseIPLink : aliased ReverseIPHandler;
      OutputLink    : aliased OutputHandler;
      Start : Time;
      Finish : Time;
      Final_Time : Duration;
   begin
      Self.Process_Request;
      
      Start := Clock;
      
      InputLink := Make (InputLink,Self.Input_Name);
      IPLink := Make (IPLink); 
      KeyGenLink := Make (KeyGenLink);
      FeistelLink := Make (FeistelLink);
      FeistelLink.Set_Mode(Self.Mode);
      ReverseIPLink := Make (ReverseIPLink);

      
      OutputLink := Make (OutputLink);
      OutputLink.Set_Output_Name(Self.Output_Name);
      
      Self.InputLink := InputLink;
      Self.IPLink := IPLink; 
      Self.KeyGenLink := KeyGenLink;
      Self.FeistelLink := FeistelLink;
      Self.ReverseIPLink := ReverseIPLink;
      Self.OutputLink := OutputLink;
      
      Self.Handle;
      
      Finish := Clock;
      Final_Time := Finish - Start;
      Put_Line (Final_Time'Image);
      
   end;
   
   procedure Handle (Self : in out DesHandler) is
   begin      
      Put("Container created") ; New_Line;
      Self.Create_Binary_Data_Container;
      Put("Handlers order set") ; New_Line;
      Self.Set_Handlers_Order;
      Put("Handlers containers set") ; New_Line;
      Self.Set_Handlers_Container;
      
      Self.InputLink.Handle;
   end;
   
   procedure Create_Binary_Data_Container (Self : in out DesHandler) is
   begin      
      declare
         Ptr_BinaryContainer : constant BinaryContainer_Access
           := new T_BinaryContainer(1..Self.InputLink.Get_Input_Size);
      begin
         Self.Ptr_Container := Ptr_BinaryContainer;
      end;
   end;
   
   procedure Process_Request (Self : in out DesHandler) is
      Tmp_Mode : Character := ' ';
      Tmp_Key : Unbounded_String;
   begin
      
      while (Tmp_Mode /= 'D' and Tmp_Mode /= 'E') loop
         Put ("Choose mode of algorithm (E for encryption, D for deciphering) : ");
         Tmp_Mode := To_String(Ada.Strings.Unbounded.Text_IO.Get_Line)(1);
      end loop;
      Self.Mode := Tmp_Mode;
      
      Put ("Choose the input file : ");
      Self.Input_Name := Ada.Strings.Unbounded.Text_IO.Get_Line;

      New_Line;
      
      Put ("Choose the output file (a new file will be created) : ");
      Self.Output_Name := Ada.Strings.Unbounded.Text_IO.Get_Line;
      
      while Length(Tmp_Key) /= 8 loop
         Put ("Choose a key (must be exactly 8 characters long) : ");
         Tmp_Key := Ada.Strings.Unbounded.Text_IO.Get_Line; 
         New_Line;
      end loop;
      
      Self.Ptr_Key.all := To_String(Tmp_Key);
   end;
   
   
   procedure Set_Handlers_Order (Self : in out DesHandler) is
   begin
      Self.InputLink.Set_NextHandler(Self.IPLink'Unchecked_Access);
      Self.IPLink.Set_NextHandler(Self.KeyGenLink'Unchecked_Access);
      Self.KeyGenLink.Set_NextHandler(Self.FeistelLink'Unchecked_Access);
      Self.FeistelLink.Set_NextHandler(Self.ReverseIPLink'Unchecked_Access);
      Self.ReverseIPLink.Set_NextHandler(Self.OutputLink'Unchecked_Access);
   end; 
   
   
   procedure Set_Handlers_Container (Self : in out DesHandler) is
   begin
      Self.InputLink.Set_BinaryContainer(Self.Ptr_Container);
      Self.IPLink.Set_BinaryContainer(Self.Ptr_Container);
      Self.FeistelLink.Set_BinaryContainer(Self.Ptr_Container);
      Self.ReverseIPLink.Set_BinaryContainer(Self.Ptr_Container);
      Self.OutputLink.Set_BinaryContainer(Self.Ptr_Container);
      
      Self.KeyGenLink.Set_KeyAccess(Self.Ptr_Key);
      
      Self.KeyGenLink.Set_SubKeyArrayAccess(Self.Ptr_SubKey_Array);
      Self.FeistelLink.Set_SubKeyArrayAccess(Self.Ptr_SubKey_Array);
      
      
   end;
   
   
end P_deshandler;
