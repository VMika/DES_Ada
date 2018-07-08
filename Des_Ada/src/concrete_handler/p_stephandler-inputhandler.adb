with P_StructuralTypes; use P_StructuralTypes;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Sequential_IO;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Streams; use Ada.Streams;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


package body P_StepHandler.InputHandler is
   
   -------------------------------------------------------------------------
   ------------------------- CONSTRUCTOR -----------------------------------
   -------------------------------------------------------------------------
   
   function Make (Self : in out InputHandler;
                  File_Name : in Unbounded_String) return InputHandler is
      package Char_IO is new Ada.Sequential_IO (Character);
      use Char_IO;
      Input_File : Char_IO.File_Type;
      count : Integer := 0;
      Buffer : Character;
      
   begin
      Self.Input_Name := File_Name;
      Open   (Input_File, In_File, To_String(Self.Input_Name));
      while not (End_Of_File(Input_File)) loop
         count := count + 1;
         Char_IO.Read  (File => Input_File,  Item => Buffer);
      end loop;
      Close (Input_File);
      
      Self.Set_Input_Length(count);
      
      if count mod 8 = 0 then
         Self.Set_Input_Size(count / 8);
      else
         Self.Set_Input_Size(count / 8 + 1);
      end if;
      
      if Self.Input_Length mod 8 /= 0 then
         Self.PaddingBitsNumber := 64 - (8 * (Self.Input_Length mod 8));
      else Self.PaddingBitsNumber := 0;
      end if;
          
      return Self;
   end;
   
   
   ---------------------------------------------------------------
   --- HANDLE PROCEDURE : OVERRIDEN FROM PARENT ABSTRACT CLASS ---
   ---------------------------------------------------------------
   
   overriding
   procedure Handle (Self : in out InputHandler) is
      package Char_IO is new Ada.Sequential_IO (Character);
      use Char_IO;
      
      Input : Char_IO.File_Type;
      Buffer : Character;
      TextStream : Unbounded_String;
      TmpBlock : T_BinaryBlock;
      Index : Integer := 1;
      
   begin
      -------------------------------------------------------------------------
      -- This handler has two tasks : 
      -- => Loop through the text to define where blocks start and stop
      -- => Convert these blocks into binary values and putting them in the
      -- array containing the whole text in BinaryBlock form
      -------------------------------------------------------------------------
      
      -- We're using an unbound string to add character as we read the file
      -- We initialize it at null value
      TextStream := Null_Unbounded_String;
      
      -- Opening the input file
      Open   (Input, In_File, To_String(Self.Input_Name));
      -- As long as there is a character in the file
      while not (End_Of_File(Input)) loop
         
         -- Reading the character and putting it in the TextBlock
         Char_IO.Read  (File => Input,  Item => Buffer);
         TextStream := TextStream & Buffer;
         -- If the block is full (ie 8 characters) we're calling the method 
         -- to convert the Unbound_String to Binary and emptying the TextBlock
         if Length (TextStream) = 8 then
            TmpBlock := TextBlock_To_Binary(To_String(TextStream));
            Replace_Block(Self.Get_BinaryContainer,Index,TmpBlock);
            Index := Index + 1;
            TextStream := Null_Unbounded_String;
         end if;
         
      end loop;
      
      if Length (TextStream) /= 0 then
         -- We're calling the conversion function a last time if there is uncon-
         -- verted text (shall only happen if the size of the raw text mod 8 is
         -- not 0) to convert the remaining text
         TmpBlock := TextBlock_To_Binary(To_String(TextStream));
         Replace_Block(Self.Get_BinaryContainer,Index,TmpBlock);
      end if;
      -- Closing the ressource
      Close (Input);
      
      if Self.NextHandler /= null then
         Self.NextHandler.Handle;
      end if;
      
   end;
   
   ---------------------------------------------------------------
   -------------------------  GETTER  ----------------------------
   ---------------------------------------------------------------
   
   function Get_Input_Size (Self : in InputHandler) return Integer is
   begin
      return Self.Input_Size;
   end;
   
   function Get_PaddingBitsNumber (Self : in InputHandler) return Integer is
   begin
      return Self.PaddingBitsNumber;
   end;
   
   procedure Set_Input_Length (Self : in out InputHandler;
                             Length : in Integer) is
   begin
      Self.Input_Length := Length;
   end;
   
   procedure Set_Input_Size (Self : in out InputHandler;
                             Size : in Integer) is
   begin
      Self.Input_Size := Size;
   end;
   
   
     
     

end P_StepHandler.InputHandler;
