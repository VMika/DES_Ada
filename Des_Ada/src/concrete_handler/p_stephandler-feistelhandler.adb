with Ada.Text_IO;
use Ada.Text_IO;

with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with P_StructuralTypes;
use P_StructuralTypes;

package body P_StepHandler.FeistelHandler is

   function Make (Handler : in out FeistelHandler) return FeistelHandler is
      S1, S2, S3, S4, S5, S6, S7, S8 : T_SBox;
   begin
      Handler.Ptr_BinaryContainer := null;
      Handler.Ptr_SubKeyArray := null;
      for i in Handler.SBoxOutputArray'Range loop
         Handler.SBoxOutputArray(i) := Integer_To_Binary (i,4);
      end loop;

      S1 := ((14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7),
             (0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8),
             (4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0),
             (15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13));
      Handler.SBoxArray(1) := S1;

      S2 := ((15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10),
             (3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5),
             (0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15),
             (13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9));
      Handler.SBoxArray(2) := S2;

      S3 := ((10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8),
             (13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1),
             (13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7),
             (1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12));
      Handler.SBoxArray(3) := S3;

      S4 := ((7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15),
             (13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9),
             (10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4),
             (3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14));
      Handler.SBoxArray(4) := S4;

      S5 := ((2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9),
             (14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6),
             (4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14),
             (11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3));
      Handler.SBoxArray(5) := S5;

      S6 := ((12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11),
             (10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8),
             (9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6),
             (4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13));
      Handler.SBoxArray(6) := S6;

      S7 := ((4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1),
             (13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6),
             (1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2),
             (6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12));
      Handler.SBoxArray(7) := S7;

      S8 := ((13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7),
             (1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2),
             (7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8),
             (2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11));
      Handler.SBoxArray(8) := S8;

      return Handler;
   end;

   procedure Handle (Self : in out FeistelHandler) is

   begin
      -- ENCRYPTION MODE
      if Self.Mode = 'E' then
         for BlockIndex in Self.Ptr_BinaryContainer.all'Range loop
            for Round in 1..16 loop
               Feistel_Round(Self,Self.Ptr_BinaryContainer.all(BlockIndex),Round);
            end loop;
            FinalInversion(Self.Ptr_BinaryContainer.all(BlockIndex));
         end loop;
         -- DECRYPTION MODE
      else
         for BlockIndex in Self.Ptr_BinaryContainer.all'Range loop
            for Round in 1..16 loop
                 Feistel_Round(Self,Self.Ptr_BinaryContainer.all(BlockIndex),17-Round);
            end loop;
            FinalInversion(Self.Ptr_BinaryContainer.all(BlockIndex));
         end loop;
      end if;

      if Self.NextHandler /= null then
         Self.NextHandler.Handle;
      end if;
   end;

   function Process_Block (Self : in FeistelHandler;
                           Block : in out T_BinaryBlock)
                           return T_BinaryBlock is
   begin
      if Self.Mode = 'E' then
         for Round in 1..16 loop
               Feistel_Round(Self,Block,Round);
         end loop;
      else
         for Round in 1..16 loop
               Feistel_Round(Self,Block,17-Round);
         end loop;
      end if;
      FinalInversion(Block);

      return Block;
   end;


   procedure Feistel_Round (Self : in FeistelHandler;
                           Block : in out T_BinaryBlock;
                           Round : in Integer) is
      TmpLeft, TmpRight : T_BinaryHalfBlock;
      FeistelHalfBlock : T_BinaryHalfBlock;
   begin
      TmpLeft := Block(1..32);
      TmpRight := Block(33..64);

      FeistelHalfBlock :=
        Feistel_Function(Self,
                         Block(33..64),
                         Self.Ptr_SubKeyArray.all(Round));

      TmpLeft := O_plus(FeistelHalfBlock, Block(1..32));


      Block(1..32) := TmpRight;
      Block(33..64) := TmpLeft;
   end;




   function Feistel_Function (Self : in FeistelHandler;
                              HalfBlock : T_BinaryHalfBlock;
                              SubKey : T_BinarySubKey)
                              return T_BinaryHalfBlock is
      ExpandedBlock : T_BinaryExpandedBlock;
      FinalBlock : T_BinaryHalfBlock;
   begin
      ExpandedBlock := Expansion(HalfBlock);
      ExpandedBlock := O_plus (ExpandedBlock,SubKey);
      FinalBlock := SBox_Substitution(Self,ExpandedBlock);
      FinalBlock := Permutation(FinalBlock);
      return FinalBlock;
   end;

   function SBox_Substitution (Self : in FeistelHandler;
                               ExpandedBlock : T_BinaryExpandedBlock)
                               return T_BinaryHalfBlock is
      CompressedBlock : T_BinaryHalfBlock;
   begin
      for i in 1..8 loop
         CompressedBlock(1+(i-1)*4..4*i) :=
           SBox_Output(Self,ExpandedBlock(1+(i-1)*6..6*i),i);
      end loop;
      return CompressedBlock;
   end;

   function SBox_Output (Self : in FeistelHandler;
                         Input : T_BinaryUnit;
                         SBoxNumber : Integer) return T_BinaryUnit is
      ColumnNumber : Integer;
      RowNumber : Integer;
   begin
      ColumnNumber :=
        Integer(Input(Input'First+1))*8 +
        Integer(Input(Input'First+2))*4 +
        Integer(Input(Input'First+3))*2 +
        Integer(Input(Input'First+4))*1;
      RowNumber := Integer(Input(Input'First))*2 + Integer(Input(Input'Last))*1;

      return Self.SBoxOutputArray(Self.SBoxArray(SBoxNumber)(RowNumber,ColumnNumber));
   end;

   function Expansion (HalfBlock : T_BinaryHalfBlock)
                              return T_BinaryExpandedBlock is
      ExpandedBlock : T_BinaryExpandedBlock;
      PermIndex : Integer;
   begin
      PermIndex := 0;
      for Index in 2..47 loop
         if Index mod 6 = 1 then
            PermIndex := PermIndex - 1;
         else
            PermIndex := PermIndex + 1;
         end if;
         ExpandedBlock(Index) := HalfBlock(PermIndex);
      end loop;

      ExpandedBlock(1) := HalfBlock(32);
      ExpandedBlock(48) := HalfBlock(1);

      return ExpandedBlock;
   end;

   function Permutation (HalfBlock : T_BinaryHalfBlock)
                         return T_BinaryHalfBlock is
      PermutedBlock : T_BinaryHalfBlock;
   begin
      PermutedBlock(1) := HalfBlock(16);
      PermutedBlock(2) := HalfBlock(7);
      PermutedBlock(3) := HalfBlock(20);
      PermutedBlock(4) := HalfBlock(21);
      PermutedBlock(5) := HalfBlock(29);
      PermutedBlock(6) := HalfBlock(12);
      PermutedBlock(7) := HalfBlock(28);
      PermutedBlock(8) := HalfBlock(17);
      PermutedBlock(9) := HalfBlock(1);
      PermutedBlock(10) := HalfBlock(15);
      PermutedBlock(11) := HalfBlock(23);
      PermutedBlock(12) := HalfBlock(26);
      PermutedBlock(13) := HalfBlock(5);
      PermutedBlock(14) := HalfBlock(18);
      PermutedBlock(15) := HalfBlock(31);
      PermutedBlock(16) := HalfBlock(10);
      PermutedBlock(17) := HalfBlock(2);
      PermutedBlock(18) := HalfBlock(8);
      PermutedBlock(19) := HalfBlock(24);
      PermutedBlock(20) := HalfBlock(14);
      PermutedBlock(21) := HalfBlock(32);
      PermutedBlock(22) := HalfBlock(27);
      PermutedBlock(23) := HalfBlock(3);
      PermutedBlock(24) := HalfBlock(9);
      PermutedBlock(25) := HalfBlock(19);
      PermutedBlock(26) := HalfBlock(13);
      PermutedBlock(27) := HalfBlock(30);
      PermutedBlock(28) := HalfBlock(6);
      PermutedBlock(29) := HalfBlock(22);
      PermutedBlock(30) := HalfBlock(11);
      PermutedBlock(31) := HalfBlock(4);
      PermutedBlock(32) := HalfBlock(25);

      return PermutedBlock;
   end;

   procedure FinalInversion (Block : in out T_BinaryBlock) is
      TmpLeft, TmpRight : T_BinaryHalfBlock;
   begin
      TmpLeft := Block(1..32);
      TmpRight := Block(33..64);
      Block(1..32) := TmpRight;
      Block(33..64) := TmpLeft;
   end;



   function Get_SBoxArray (Self : in out FeistelHandler) return T_SBoxArray is
   begin
      return Self.SBoxArray;
   end;

   function Get_SBoxOutputArray (Self : in out FeistelHandler)
                          return T_BinaryIntegerArray is
   begin
      return Self.SBoxOutputArray;
   end;

   procedure Set_SubKeyArrayAccess (Self : in out FeistelHandler;
                                    Ptr : in BinarySubKeyArray_Access) is
   begin
      Self.Ptr_SubKeyArray := Ptr;
   end;

   procedure Set_Mode (Self : in out FeistelHandler;
                       Mode : Character) is
   begin
      Self.Mode := Mode;
   end;


   end P_StepHandler.FeistelHandler;
