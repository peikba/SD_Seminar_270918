codeunit 123456798 "Upgrade Seminar"
{
   procedure OnNavAppUpgradePerCompany();
   var
       myInt : Integer;
   begin
       error(NavApp.GetArchiveVersion);
       
   end;
}