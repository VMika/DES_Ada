with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body P_StepHandler.KeyHandler is
   
   function Make (Self : in out KeyHandler) return KeyHandler is
   begin
      Self.Ptr_Key := null;
      Self.Ptr_SubKeyArray := null;
      return Self;
   end;
    
   overriding
   procedure Handle (Self : in out KeyHandler) is
      InitialBinaryKey : T_BinaryKey;
      TmpFormattedKey : T_BinaryFormattedKey;
      SubKey : T_BinarySubKey;
      
   begin
      
      InitialBinaryKey := TextBlock_To_Binary(Self.Ptr_Key.all);
      TmpFormattedKey := PermutationChoice1_Key(InitialBinaryKey);
        
      for Round in 1..16 loop
         KeyShift(TmpFormattedKey, Round);
         SubKey := PermutationChoice2_Key(TmpFormattedKey);
         Self.Ptr_SubKeyArray.all(Round) := SubKey;
      end loop;
      
      if Self.NextHandler /= null then
         Self.NextHandler.Handle;
      end if;
      
   end;
   
   function PermutationChoice1_Key (BinaryKey : in out T_BinaryKey) 
                                    return T_BinaryFormattedKey is
      PermIndex : Integer;
      P1BinaryKey : T_BinaryFormattedKey;
      
   begin
      PermIndex := 57;
      
      for BitIndex in 1..28 loop      
         P1BinaryKey(BitIndex) := BinaryKey(PermIndex);
         if (PermIndex-8 > 0) then
            PermIndex := PermIndex-8;
         else
            PermIndex := PermIndex + 57 ;   
         end if;
      end loop;
      
      PermIndex := 63;
      
      for BitIndex in 29..52 loop     
            P1BinaryKey(BitIndex) := BinaryKey(PermIndex);
            if (PermIndex-8 > 0) then
               PermIndex := PermIndex-8;
            else
               PermIndex := PermIndex + 55;
            end if;               
      end loop;
      
      PermIndex := 28;
      
      for BitIndex in 53..56 loop     
            P1BinaryKey(BitIndex) := BinaryKey(PermIndex);
            PermIndex := PermIndex-8;
      end loop;
      
      return P1BinaryKey;
   end;   
   
   procedure KeyShift (Key : in out T_BinaryFormattedKey;
                        Round : in Positive) is
      HalfLeft, HalfRight : T_BinaryHalfFormattedKey;
      Iteration : Integer;
   begin
      HalfLeft := Key(1..28);
      HalfRight := Key(29..56);
      
      if Round = 1 or Round = 2 or Round = 9 or Round = 16 then
         Iteration := 1;
      else
         Iteration := 2;
      end if;

      Left_Shift (HalfLeft, Iteration);
      Left_Shift (HalfRight, Iteration); 
      
      Key(1..28) := HalfLeft;
      Key(29..56) := HalfRight;
   end;
   
   
   function PermutationChoice2_Key (Key : in out T_BinaryFormattedKey) 
                                    return T_BinarySubKey is
      SubKey : T_BinarySubKey;
   begin
      SubKey(1) := Key(14);
      SubKey(2) := Key(17);
      SubKey(3) := Key(11);
      SubKey(4) := Key(24);
      SubKey(5) := Key(1);
      SubKey(6) := Key(5);
      SubKey(7) := Key(3);
      SubKey(8) := Key(28);
      SubKey(9) := Key(15);
      SubKey(10) := Key(6);
      SubKey(11) := Key(21);
      SubKey(12) := Key(10);
      SubKey(13) := Key(23);
      SubKey(14) := Key(19);
      SubKey(15) := Key(12);
      SubKey(16) := Key(4);
      SubKey(17) := Key(26);
      SubKey(18) := Key(8);
      SubKey(19) := Key(16);
      SubKey(20) := Key(7);
      SubKey(21) := Key(27);
      SubKey(22) := Key(20);
      SubKey(23) := Key(13);
      SubKey(24) := Key(2);
      SubKey(25) := Key(41);
      SubKey(26) := Key(52);
      SubKey(27) := Key(31);
      SubKey(28) := Key(37);
      SubKey(29) := Key(47);
      SubKey(30) := Key(55);
      SubKey(31) := Key(30);
      SubKey(32) := Key(40);
      SubKey(33) := Key(51);
      SubKey(34) := Key(45);
      SubKey(35) := Key(33);
      SubKey(36) := Key(48);
      SubKey(37) := Key(44);
      SubKey(38) := Key(49);
      SubKey(39) := Key(39);
      SubKey(40) := Key(56);
      SubKey(41) := Key(34);
      SubKey(42) := Key(53);
      SubKey(43) := Key(46);
      SubKey(44) := Key(42);
      SubKey(45) := Key(50);
      SubKey(46) := Key(36);
      SubKey(47) := Key(29);
      SubKey(48) := Key(32);
      
      return SubKey;
   end;
     
   
   procedure Set_SubKeyArrayAccess (Self : in out KeyHandler ;
                              Ptr_SubKeyAray : in BinarySubKeyArray_Access) is
   begin
      Self.Ptr_SubKeyArray := Ptr_SubKeyAray;
   end;
   
   procedure Set_KeyAccess (Self : in out KeyHandler;
                            Ptr_Key : in Key_Access) is
   begin
      Self.Ptr_Key := Ptr_Key;
   end;
   
   
   end P_StepHandler.KeyHandler;
